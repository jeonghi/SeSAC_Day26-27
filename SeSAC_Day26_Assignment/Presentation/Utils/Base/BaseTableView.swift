//
//  BaseTableView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit

class BaseTableView: UITableView {
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configView()
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    configView()
  }
  
  override func configView() {
    backgroundColor = ColorStyle.backgroundColor
  }
}
