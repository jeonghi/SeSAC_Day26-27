//
//  UserDefaultManager.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/3/24.
//

import Foundation

final class UserDefaultManager {
  
  private init() {}
  
  // MARK: Properties
  @UserDefaultWrapper(key: Key.FIRST_LAUNCH.rawValue, defaultValue: true)
  static var isFirstLaunch: Bool
  
  // MARK: Method
  static func resetAllLocalData(){}
}

extension UserDefaultManager {
  /// 키 정의
  enum Key: String {
    case FIRST_LAUNCH
  }
}
