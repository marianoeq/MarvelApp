//
//  Character.swift
//  Marvel
//
//  Created by Mariano Quiroga on 8/6/24.
//

import Foundation

struct ApiResponse: Codable {
  var data: CharacterResult
}

struct CharacterResult: Codable {
  var results: [CharactersData]
}

struct CharactersData: Codable {
  var name: String?
  var description: String?
  var thumbnail: Thumbnail
  var urls: [Urls]
}

struct Thumbnail: Codable {
  var path: String? 
  var formato: String?

  enum CodingKeys: String, CodingKey {
    case path
    case formato = "extension"
  }
}

struct Urls: Codable {
  var url: String? 
}

