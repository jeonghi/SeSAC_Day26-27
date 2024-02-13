//
//  Local+Extension.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

extension Locale {
  static var currentLanguageCode: String {
//    return Locale.current.language.languageCode?.identifier ?? "kr"
    return "ko"
  }
  
  static var currentCountryCode: String {
//    return Locale.current.region?.identifier ?? "KR"
    return "KR"
  }
  
  static var currentLanguageAndCountryCode: String {
    return "\(currentLanguageCode)-\(currentCountryCode)"
  }
}
