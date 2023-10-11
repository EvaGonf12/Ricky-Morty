//
//  String+Localizable.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Foundation

extension String {
   
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
