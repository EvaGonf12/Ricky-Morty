//
//  CharacterInteractor.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Combine
import RickMortySwiftApi
import Foundation

protocol CharacterInteractorDelegate: AnyObject {
    func didLoadList(_ list: [CharacterInfo])
    func didFailLoadingList(with error: Error)
}

protocol CharacterInteractor {
    
    var delegate: CharacterInteractorDelegate? { get set }
    func loadList()
}

class CharacterInteractorImp: CharacterInteractor {
    
    weak var delegate: CharacterInteractorDelegate?
    private let rmCharacter: RMCharacter
    private let localStorageService: LocalStorageService
    private let charactersMapper: RMListMapper
    
    init(rmCharacter: RMCharacter,
         localStorageService: LocalStorageService,
         charactersMapper: RMListMapper = RMListMapper()) {
        self.rmCharacter = rmCharacter
        self.localStorageService = localStorageService
        self.charactersMapper = charactersMapper
    }
    
    func loadList() {
        loadAllList()
    }
    
    private func loadAllList() {
        Task {
            do {
                let characters = try await rmCharacter.getAllCharacters().map(charactersMapper.map)
                DispatchQueue.main.async {
                    self.delegate?.didLoadList(characters)
                }
            } catch (let error) {
                DispatchQueue.main.async {
                    self.delegate?.didFailLoadingList(with: error)
                }
            }
        }
    }
    
    private func loadListPagination() {
        Task {
            do {
                let characters = try await rmCharacter.getCharactersByPageNumber(pageNumber: nextPage).map(charactersMapper.map)
                DispatchQueue.main.async {
                    self.delegate?.didLoadList(characters)
                }
            } catch (let error) {
                DispatchQueue.main.async {
                    self.delegate?.didFailLoadingList(with: error)
                }
            }
        }
    }
}

// Pagination
private extension CharacterInteractorImp {
    
    func save(currentPage: Int) {
        localStorageService.store(value: currentPage, forKey: .currentPage)
    }
    
    var nextPage: Int {
        return localStorageService.integer(forKey: .currentPage) + 1
    }
}

// MARK: - Assembly

extension Assembly {
    
    var characterInteractor: CharacterInteractor {
        return CharacterInteractorImp(rmCharacter: RMCharacter(client: networking.rmClient),
                                      localStorageService: localStorageService,
                                      charactersMapper: RMListMapper())
    }
}
