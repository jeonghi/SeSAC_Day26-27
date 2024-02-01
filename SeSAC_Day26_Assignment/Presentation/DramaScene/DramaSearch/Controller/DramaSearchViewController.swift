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
  
  
  // MARK: Dependency
  var tvService: TVService { AppService.apiService.tvService }
  
  lazy var searchController = UISearchController(searchResultsController: nil).then {
    $0.searchBar.placeholder = "검색어를 입력해주세요"
    $0.searchBar.delegate = self
    $0.searchBar.setValue("취소", forKeyPath: "cancelButtonText")
    $0.searchBar.setShowsCancelButton(true, animated: true)
    //    $0.searchBar.searchTextField.font = Style.Foundation.Font.caption
  }
  
  var tapGestureRecognizer: UITapGestureRecognizer = .init().then {
    $0.addTarget(DramaSearchViewController.self, action: #selector(tappedAroundView))
  }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Action
  @objc func tappedAroundView(_ sender: Any){
    view.endEditing(true)
  }
  
  // MARK: Configure
  override func configView() {
    //    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationItem.title = "검색"
    self.navigationItem.searchController = searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
    //    self.navigationItem.titleView = searchBar
    view.addGestureRecognizer(tapGestureRecognizer)
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

extension DramaSearchViewController: UISearchBarDelegate {
  
  /// 검색 버튼을 누른 경우에 대한 처리 메서드
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let query = searchBar.text else {
      return
    }
    callRequest(query: query)
  }
  
  /// 검색을 요청하는 메서드
  func callRequest(query: String) {
    isLoading = true
    
    // 전처리에 대한 책임을 여기에 두는게 맞을까?..
    let preprocessedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // 디스패치 그룹 연습용으로 선언..
    let group = DispatchGroup()
    group.enter()
    
    tvService.searchTV(query: preprocessedQuery) { res in
      group.leave()
      switch res {
      case .success(let success):
        dump(success)
        self.routeToDetail(query: query)
      case .failure(let error):
        dump(error)
      }
    }
    
    group.notify(queue: .main){
      self.isLoading = false
    }
  }
}

// MARK: Navigator
extension DramaSearchViewController {
  
  /// 상세 화면으로 이동
  @objc func routeToDetail(query: String = "") {
    let dramaVC = DramaDetailViewController()
    navigationController?.pushViewController(dramaVC, animated: true)
  }
}

//@available(iOS 17.0, *)
//#Preview {
//  let nc = UINavigationController(rootViewController: DramaSearchViewController())
//  return nc
//}
