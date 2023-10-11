//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Foundation

enum CharacterListViewState {
    case loading
    case list
    case empty
    case error
}

protocol CharacterListViewModelDelegate: AnyObject {
    func loading(visible: Bool)
}

final class CharacterListViewModel: ObservableObject {
    
    private let characterInteractor: CharacterInteractor
    private let characterNavigator: CharacterListNavigator
    
    weak var delegate: CharacterListViewModelDelegate?
    
    @Published var list: [CharacterInfo]
    @Published var viewState: CharacterListViewState
    
    init(characterInteractor: CharacterInteractor,
         characterNavigator: CharacterListNavigator) {
        self.characterInteractor = characterInteractor
        self.characterNavigator = characterNavigator
        self.list = []
        self.viewState = .loading
    }
    
    func onAppear() {
        if list.isEmpty {
            fetchCharacterList()
        }
    }
    
    func shouldLoadMoreData(id: Int) {
        // TODO: Add pagination logic if needed (data and viewState)
        characterInteractor.loadList()
    }
    
    func showDetails(item: CharacterInfo) {
        characterNavigator.userWantsToShowCharacterDetails(item)
    }
    
    private func fetchCharacterList() {
        viewState = .loading
        delegate?.loading(visible: true)
        characterInteractor.loadList()
    }
}

extension CharacterListViewModel: CharacterInteractorDelegate {
   
    func didLoadList(_ list: [CharacterInfo]) {
        delegate?.loading(visible: false)
        self.viewState = list.isEmpty ? .empty : .list
        self.list = list
    }
    
    func didFailLoadingList(with error: Error) {
        // TODO: if pagination enabled, add toast instead of error view
        delegate?.loading(visible: false)
        self.viewState = .error
    }
}


