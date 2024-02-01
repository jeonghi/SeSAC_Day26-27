//
//  DramaPosterImageView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit

class PosterImageView: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .lightGray
    contentMode = .scaleAspectFill
    layer.cornerRadius = 12
    clipsToBounds = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
