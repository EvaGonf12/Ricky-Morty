//
//  Assembly+CharacterListDetails.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import Foundation

protocol CharacterDetailsProvider {
    func characterDetailsViewController(_ character: CharacterInfo) -> CharacterDetailsViewController
}

extension Assembly: CharacterDetailsProvider {
    
    func characterDetailsViewController(_ character: CharacterInfo) -> CharacterDetailsViewController {
        let viewModel = CharacterDetailsViewModel(details: character)
        let viewController = CharacterDetailsViewController(viewModel: viewModel)
        return viewController
    }
}
