//
//  Mappable.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import Foundation

public protocol Mappable {
  associatedtype From
  associatedtype To

  func map(_ from: From) throws -> To
}

// MARK: - Mappable + Optionals

public extension Mappable {
  func map(_ from: From?) throws -> To? {
    guard let from = from else { return nil }
    return try map(from)
  }
}

// MARK: - Mappable + Array

public extension Mappable {
  func map(elements: [From]) throws -> [To] {
    return try elements.map { element -> To in
      return try map(element)
    }
  }

  // MARK: - Optionals

  func map(elements: [From]?) throws -> [To] {
    guard let newElements = elements else { return [] }
    return try map(
      elements: newElements
    )
  }
}
