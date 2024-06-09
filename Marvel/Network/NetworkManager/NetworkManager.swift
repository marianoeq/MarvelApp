//
//  NetworkManager.swift
//  Marvel
//
//  Created by Mariano Quiroga on 8/6/24.
//

import Foundation
import CryptoKit
import Alamofire

enum apiEndpoint {
  static let marvelCharacterEndpoint = "/v1/public/characters"
}

class NetworkManager {

  public func getMarvelCharacters(completion: @escaping (Result<[CharacterResult], Error>) -> Void) {

    let apiCredentials = ApiCredentials()
    let baseUrl = "https://gateway.marvel.com/v1/public/characters"
    let hash = md5(data: "\(apiCredentials.ts)\(apiCredentials.privateApiKey!)\(apiCredentials.publicApiKey!)")
    let params: [String: String] = [
      "ts": apiCredentials.ts,
      "apikey": apiCredentials.publicApiKey!,
      "hash": hash
    ]

    AF.request(baseUrl, method: .get, parameters: params).responseDecodable(of: ApiResponse.self) {response in
      switch response.result {
      case .success(let data):
        completion(.success([data.data]))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
