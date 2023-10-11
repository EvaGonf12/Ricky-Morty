//
//  String+Date.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Foundation

extension String {
    var date: Date? {
        if let date = Date.dateFormat.date(from: self) {
            return date
        }
        return nil
    }
}
