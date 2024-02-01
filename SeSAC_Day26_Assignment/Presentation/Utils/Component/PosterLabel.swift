//
//  PosterTitleLabel.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit
import Then

class PosterLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func configView() {
    textAlignment = .left
  }
}
