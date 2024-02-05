//
//  DramaDetailView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit
import Then

class DramaDetailView: UIView {
  
  lazy var tableView: UITableView = .init(frame: .zero, style: .grouped).then {
    $0.backgroundColor = .clear
    $0.register(DramaGroupCell.self, forCellReuseIdentifier: "DramaGroupCell")
    $0.register(CountryInfoCell.self, forCellReuseIdentifier: "CountryInfoCell")
  }

  
  override init(frame: CGRect){
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(){
    self.init(frame: .zero)
    configBase()
  }
  
  override func configView() {
    
  }
  
  override func configLayout() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide)
      $0.bottom.equalTo(self.safeAreaLayoutGuide)
      $0.horizontalEdges.equalToSuperview()
    }
  }
  
  override func configHierarchy() {
    addSubviews([tableView])
  }
}
