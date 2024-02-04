//
//  String+Extension.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import Foundation

extension String {
  func toUrl() -> URL? {
    URL(string: self)
  }
}

extension String {
  func extractYear() -> Int? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd" // 입력받은 문자열의 날짜 형식 지정
    if let date = dateFormatter.date(from: self) {
      let calendar = Calendar.current
      let year = calendar.component(.year, from: date)
      return year
    } else {
      return nil // 날짜 형식이 잘못된 경우 nil 반환
    }
  }
}
