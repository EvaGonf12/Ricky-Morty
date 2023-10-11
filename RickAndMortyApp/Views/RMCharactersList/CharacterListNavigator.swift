//
//  CharacterListNavigator.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import UIKit

protocol CharacterListNavigator: AnyObject {
    func userWantsToShowCharacterDetails(_ character: CharacterInfo)
}

import UIKit

final class CharacterListNavigatorImp: CharacterListNavigator {
    
    private weak var from: UIViewController?
    private let detailsProvider: CharacterDetailsProvider
    
    init(from: UIViewController,
         detailsProvider: CharacterDetailsProvider) {
        self.from = from
        self.detailsProvider = detailsProvider
    }
    
    func userWantsToShowCharacterDetails(_ character: CharacterInfo) {
        guard let from = from else { fatalError("Why from is nil????") }
        let viewController = detailsProvider.characterDetailsViewController(character)
        from.navigationController?.pushViewController(viewController,
                                                      animated: true)
    }
}
