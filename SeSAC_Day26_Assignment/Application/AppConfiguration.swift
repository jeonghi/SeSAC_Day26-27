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
  
  // TMDb 구성 정보를 저장하는 변수
  var imageBaseURL: String?
}

extension AppConfiguration {}
