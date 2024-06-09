//
//  NetworkManager+Credentials.swift
//  Marvel
//
//  Created by Mariano Quiroga on 8/6/24.
//

import Foundation
import CryptoKit



struct ApiCredentials {
  let privateApiKey = ProcessInfo.processInfo.environment["API_KEY"]
  let publicApiKey = ProcessInfo.processInfo.environment["PUBLIC_API_KEY"]
  let ts = String(Date().timeIntervalSince1970)
}

public func md5(data: String) -> String {

  let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())

  return hash.map{
    String(format: "%02hhx", $0)
  }.joined()
}
