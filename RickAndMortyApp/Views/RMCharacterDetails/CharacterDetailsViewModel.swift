//
//  CharacterDetailsViewModel.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import Foundation

final class CharacterDetailsViewModel: ObservableObject {
    
    @Published var details: CharacterInfo
    
    init(details: CharacterInfo) {
        self.details = details
    }
    
    func onAppear() {}
}
