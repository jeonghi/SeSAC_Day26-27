//
//  FontStyle.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit

enum FontStyle {
  
  static let title1 = customFont(weight: .Bold, size: 28)
  static let title2 = customFont(weight: .Bold, size: 22)
  static let headline = customFont(weight: .Medium, size: 18)
  static let exceptional = customFont(weight: .Medium, size: 16)
  static let subheadline = customFont(weight: .Bold, size: 14)
  static let caption = customFont(weight: .Light, size: 11)
  
  enum FontFamily: String {
    case GmarketSansTTF
  }
  
  enum FontWeight: String {
    case Bold
    case Light
    case Medium
  }
  
  static func customFont(family: FontFamily = .GmarketSansTTF, weight: FontWeight, size: CGFloat) -> UIFont? {
    UIFont(name: "\(family.rawValue)\(weight.rawValue)", size: size)
  }
}
