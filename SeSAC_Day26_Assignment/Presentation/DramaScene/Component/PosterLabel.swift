//
//  PosterTitleLabel.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit
import Then

class PosterLabel: UILabel {
  
  var padding: UIEdgeInsets = .zero
  
  var left: CGFloat {
    get { self.padding.left }
    set { self.padding.left = newValue }
  }
  
  var right: CGFloat {
    get { self.padding.right }
    set { self.padding.right = newValue }
  }
  
  var top: CGFloat {
    get { self.padding.top }
    set { self.padding.top = newValue }
  }
  
  var bottom: CGFloat {
    get { self.padding.bottom }
    set { self.padding.bottom = newValue }
  }
  
  override var intrinsicContentSize: CGSize {
    var size = super.intrinsicContentSize
    size.width += padding.left + padding.right
    size.height += padding.top + padding.bottom
    return size
  }
  
  /// 사용하기 편리하게 필요한 값들을 파라미터로 받을 수 있는 생성자
  convenience init(_ text: String) {
    self.init(frame: .zero)
    self.text = text
  }
  
  override init(frame: CGRect) {
    self.padding = .zero
    super.init(frame: frame)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  override func configView() {
    
    textAlignment = .center
    textColor = Style.Foundation.Color.tintColor
    backgroundColor = Style.Foundation.Color.backgroundColor.withAlphaComponent(0.5)
    font = Style.Foundation.Font.exceptional
    clipsToBounds = true
    layer.cornerRadius = 10
    layer.cornerCurve = .continuous
    
    left = 10
    right = 10
    top = 10
    bottom = 10
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 17.0, *)
#Preview {
  UIViewPreview {
    PosterLabel("하하")
  }
  .previewLayout(.sizeThatFits)
}
#endif
