//
//  MarvelDataInteractor.swift
//  Marvel
//
//  Created by Mariano Quiroga on 8/6/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MarvelDataBusinessLogic {

}

protocol MarvelDataDataStore {
  //var name: String { get set }
}

class MarvelDataInteractor: MarvelDataBusinessLogic, MarvelDataDataStore {
  var presenter: MarvelDataPresentationLogic?
  var worker: MarvelDataWorker?
  //var name: String = ""
  
  // MARK: Do something
  
}
