//
//  LocalStorage.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Foundation

enum LocalStorageKey: String {
    case currentPage
}

protocol LocalStorageService {
    func store(value: Int, forKey key: LocalStorageKey)
    func integer(forKey key: LocalStorageKey) -> Int
}

struct UserDefaultsLocalStorage: LocalStorageService {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func store(value: Int, forKey key: LocalStorageKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func integer(forKey key: LocalStorageKey) -> Int {
        return userDefaults.integer(forKey: key.rawValue)
    }
}

// MARK: - Assembly
extension Assembly {
    var localStorageService: LocalStorageService {
        return UserDefaultsLocalStorage(userDefaults: UserDefaults.standard)
    }
}
