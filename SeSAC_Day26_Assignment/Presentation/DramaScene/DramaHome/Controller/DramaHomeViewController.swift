//
//  DramaHomeViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit
import Then
import SnapKit

final class DramaHomeViewController: BaseViewController {
  
  lazy var searchNavigationBarButtonItem: UIBarButtonItem = .init(title: "검색", image: Style.Foundation.Icon.magnifyingglass, target: self, action: #selector(routeToSearch))
  
  // 옵저버를 등록해놓고 바꿔야함.
  lazy var notiNavigationBarButtonItem: UIBarButtonItem = .init(title: "알림", image: Style.Foundation.Icon.bell, target: self, action: #selector(routeToNoti))
  
  lazy var tableView: UITableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    $0.rowHeight = 60
  }
  
  var tvService: TVService { AppService.apiService.tvService }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    callRequest()
  }
  
  // MARK: Configure
  override func configHierarchy() {
    view.addSubviews([])
  }
  
  override func configView() {
    navigationItem.rightBarButtonItems = [notiNavigationBarButtonItem, searchNavigationBarButtonItem]
    navigationItem.title = "드라마 홈"
  }
  
  override func configLayout() {
  }
}

extension DramaHomeViewController {
  func callRequest() {
    let group = DispatchGroup()
    isLoading = true
    group.enter()
    tvService.getTopRatedTVs(language: "ko_KR") { res in
      dump(res)
      group.leave()
    }
    
    group.notify(queue: .main){
      self.isLoading = false
    }
  }
}

// MARK: Navigator
extension DramaHomeViewController {
  
  /// 검색 화면으로 이동
  @objc func routeToSearch() {
    let vc = DramaSearchViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func routeToNoti() {
    let vc = BaseViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

#Preview {
  let nc = UINavigationController(rootViewController: DramaHomeViewController())
  return nc
}

extension DramaHomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    .init()
  }
}

extension DramaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: 200, height: 200)
  }
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    .init()
  }
  
  static func setCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
    .init()
  }
}
