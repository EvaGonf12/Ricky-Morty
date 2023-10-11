//
//  Assembly.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

final class Assembly {
    fileprivate static let shared = Assembly()
}

var rickyMortyAssembly: Assembly {
    return Assembly.shared
}
