//
//  DramaHomeView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/7/24.
//

import UIKit

class DramaHomeView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configBase()
  }
  
  override func configView() {
    
  }
  
  override func configLayout() {
    
  }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 17.0, *)
#Preview {
  UIViewPreview {
    DramaHomeView()
  }
  .previewLayout(.sizeThatFits)
}

#endif
