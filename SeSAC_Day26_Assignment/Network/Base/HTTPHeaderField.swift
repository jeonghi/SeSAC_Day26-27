//
//  HTTPHeaderField.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
}

enum ContentType: String {
  case json = "Application/json"
}

enum AuthenticationType: String {
  case bearer = "Bearer"
  case basic = "Basic"
}
