//
//  BaseView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit

class BaseView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configBase()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
