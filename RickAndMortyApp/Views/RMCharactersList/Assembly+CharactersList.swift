//
//  Assembly+CharactersList.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import SwiftUI

protocol CharactersListProvider {
    func characterListViewController() -> CharactersListViewController
}

extension Assembly: CharactersListProvider {
    
    func characterListViewController() -> CharactersListViewController {
        let viewController = CharactersListViewController()
        let navigator = navigator(from: viewController)
        var interactor = characterInteractor
        let viewModel = CharacterListViewModel(characterInteractor: interactor,
                                               characterNavigator: navigator)
        interactor.delegate = viewModel
        viewModel.delegate = viewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func navigator(from: CharactersListViewController) -> CharacterListNavigator {
        return CharacterListNavigatorImp(from: from, detailsProvider: self)
    }
}
