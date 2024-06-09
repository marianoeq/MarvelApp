//
//  imageHelper.swift
//  Marvel
//
//  Created by Mariano Quiroga on 9/6/24.
//

import Foundation
import UIKit

extension UIImageView {
  
  func imageFrom(url:URL?) {
    DispatchQueue.global().async { [weak self] in
      guard let url else {
        return
      }
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}
