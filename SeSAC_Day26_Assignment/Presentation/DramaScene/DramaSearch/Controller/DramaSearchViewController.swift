//
//  DramaSearchViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit
import Then
import SnapKit

final class DramaSearchViewController: BaseViewController {
  
  var searchController = UISearchController(searchResultsController: nil).then {
    $0.searchBar.placeholder = "검색어를 입력해주세요"
  }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Configure
  override func configView() {
//    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationItem.title = "검색"
    self.navigationItem.searchController = searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
//    self.navigationItem.titleView = searchBar
  }
  
  override func configLayout() {
//    searchBar.snp.makeConstraints {
//      $0.top.equalTo(view.safeAreaLayoutGuide)
//      $0.horizontalEdges.equalToSuperview()
//    }
  }
  
  override func configHierarchy() {
  }
}

// MARK: Navigator
extension DramaSearchViewController {
  
  /// 상세 화면으로 이동
  @objc func routeToDetail(query: String) {
    let dramaVC = DramaDetailViewController()
    navigationController?.pushViewController(dramaVC, animated: true)
  }
}

#Preview {
  let nc = UINavigationController(rootViewController: DramaSearchViewController())
  return nc
}
