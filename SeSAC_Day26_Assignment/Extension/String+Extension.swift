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
