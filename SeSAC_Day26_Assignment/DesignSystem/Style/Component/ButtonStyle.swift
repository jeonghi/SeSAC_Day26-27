//
//  ButtonStyle.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit

struct ButtonStyle {
  
  let activeTintColor: UIColor
  let activeBackgroundColor: UIColor
  let inactiveTintColor: UIColor
  let inactiveBackgroundColor: UIColor
  let font: UIFont
  let radius: CGFloat
  
  static let primary = ButtonStyle(
    activeTintColor:  Style.Foundation.Color.tintColor,
    activeBackgroundColor: Style.Foundation.Color.pointColor,
    inactiveTintColor: Style.Foundation.Color.inactiveTintColor,
    inactiveBackgroundColor: Style.Foundation.Color.inactiveBackgroundColor,
    font: Style.Foundation.Font.headline,
    radius: 6.0
  )
}
