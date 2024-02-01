//
//  APIService.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

final class APIService {
  
  static let shared = APIService()
  
  private init() {}
  
  let tvService = TVService.shared
}
