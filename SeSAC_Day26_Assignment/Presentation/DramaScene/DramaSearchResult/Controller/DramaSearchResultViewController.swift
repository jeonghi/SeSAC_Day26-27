//
//  DramaSearchResultViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit
import Then

final class DramaSearchResultViewController: BaseViewController {
 
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: Configure
  override func configHierarchy() {
    
  }
  
  override func configLayout() {
    
  }
  
  override func configView() {
    navigationItem.title = "드라마 결과 블라블라에 대한 검색 결과"
  }
}

// MARK: Navigator
extension DramaSearchResultViewController {
  
  /// 검색 화면으로 이동
  @objc func routeToDetail() {
    let vc = DramaDetailViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

#Preview {
  let nc = UINavigationController(rootViewController: DramaSearchResultViewController())
  return nc
}
