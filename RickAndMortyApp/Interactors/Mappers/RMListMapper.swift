//
//  RMListMapper.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import RickMortySwiftApi

struct RMListMapper: Mappable {
    
    func map(_ from: RMCharacterModel) -> CharacterInfo {
        return CharacterInfo(from: from)
    }
}
