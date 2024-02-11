//
//  UpdateUserProfileView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import Then
import SnapKit

class UpdateUserProfileView: BaseView {
  
  let textField = UITextField(frame: .zero).then {
    $0.borderStyle = .roundedRect
    $0.backgroundColor = Style.Foundation.Color.tintColor.withAlphaComponent(0.5)
    $0.placeholder = "입력하세요"
  }
  
  func config(content: String?) {
    textField.text = content
  }
  
  override func configLayout() {
    textField.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(10)
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
      $0.height.equalTo(60)
    }
  }
  
  override func configHierarchy() {
    addSubviews([textField])
  }
}

@available(iOS 17.0, *)
#Preview {
  UpdateUserProfileView()
}
