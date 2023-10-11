//
//  CharacterInfo.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import RickMortySwiftApi
import Foundation
import SwiftUI

struct CharacterInfo {
    let id: Int
    let name: String?
    let status: CharacterStatus?
    let species: String?
    let type: String?
    let gender: CharacterGender?
    let origin: CharacterOrigin?
    let location: CharacterLocation?
    let image: String?
    let episode: [URL?]?
    let url: URL?
    let created: Date?
    
    init(from character: RMCharacterModel) {
        self.id = character.id
        self.name = character.name
        self.status = CharacterStatus(rawValue: character.status)
        self.species = character.species
        self.type = character.type
        self.gender = CharacterGender(rawValue: character.gender)
        self.origin = CharacterOrigin(from: character.origin)
        self.location = CharacterLocation(from: character.location)
        self.image = character.image
        self.episode = character.episode.compactMap { URL(string: $0) }
        self.url = URL(string: character.url)
        self.created = character.created.date
    }
    
    init(id: Int, name: String?, status: CharacterStatus?, species: String?, type: String?, gender: CharacterGender?, origin: CharacterOrigin?, location: CharacterLocation?, image: String?, episode: [URL?]?, url: URL?, created: Date?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

extension CharacterInfo {
    static var mock = CharacterInfo(id: 0, name: "Rick Sanchez", status: .alive, species: "Human", type: "", gender: .male, origin: nil, location: nil, image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: [], url: nil, created: nil)
}

enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

extension CharacterStatus {
    var color: Color {
        switch self {
            case .alive:
                return Color.success
            case .dead:
                return Color.error
            case .unknown:
                return Color.contentLow
        }
    }
}

enum CharacterGender: String {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}

extension CharacterGender {
    var image: Image {
        switch self {
            case .male:
                return Image("gender-male")
            case .female:
                return Image("gender-female")
            case .genderless:
                return Image("genderless")
            case .unknown:
                return Image("genderless")
        }
    }
}

struct CharacterOrigin {
    let name: String?
    let url: String?
    
    init(from location: RMCharacterOriginModel) {
        self.name = location.name
        self.url = location.url
    }
}

struct CharacterLocation {
    let name: String?
    let url: String?
    
    init(from location: RMCharacterLocationModel) {
        self.name = location.name
        self.url = location.url
    }
}
