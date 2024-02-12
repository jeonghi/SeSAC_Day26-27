//
//  DramaDetailView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit
import Then

class DramaDetailView: BaseView {
  
  let youtubeWebView: YouTubeWebView = .init()
  
  lazy var tableView: UITableView = .init(frame: .zero, style: .grouped).then {
    $0.backgroundColor = .clear
    $0.register(DramaGroupCell.self, forCellReuseIdentifier: "DramaGroupCell")
    $0.register(CountryInfoCell.self, forCellReuseIdentifier: "CountryInfoCell")
    $0.tableHeaderView = youtubeWebView
  }
  
  override func configLayout() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide)
      $0.bottom.equalTo(self.safeAreaLayoutGuide)
      $0.horizontalEdges.equalToSuperview()
    }
    
    youtubeWebView.snp.makeConstraints {
      $0.height.equalTo(150)
      $0.width.equalToSuperview()
    }
  }
  
  override func configHierarchy() {
    addSubviews([tableView])
  }
}
