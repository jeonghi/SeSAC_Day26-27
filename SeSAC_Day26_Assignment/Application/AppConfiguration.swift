//
//  AppConfiguration.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

final class AppConfiguration {
  
  static let shared = AppConfiguration()
  
  private init() {}
  
  lazy var accessToken: String = {
    return Bundle.main.object(forInfoDictionaryKey: "ACCESS_TOKEN") as? String ?? ""
  }()
  
  lazy var baseURL: String = {
    return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
  }()
  
  var imageBaseURL: String = "https://image.tmdb.org/t/p/w500"
}

extension AppConfiguration {}
