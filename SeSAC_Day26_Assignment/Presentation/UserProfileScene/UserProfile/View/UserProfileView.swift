//
//  SettingUserProfileView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import SnapKit
import Then

class UserProfileView: BaseView {
  let tableView: BaseTableView = .init(frame: .zero, style: .grouped).then {
    $0.separatorStyle = .none
  }
}

extension UserProfileView {
  
  override func configView() {
    
  }
  
  override func configLayout() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(self.safeAreaLayoutGuide)
    }
  }
  
  override func configHierarchy() {
    self.addSubviews([tableView])
  }
}
