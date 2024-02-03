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
  
  // MARK: Dependency
  var tvService: TVService { AppService.apiService.tvService }
  
  // MARK: Propeties
  lazy var searchNavigationBarButtonItem: UIBarButtonItem = .init(title: "검색", image: Style.Foundation.Icon.magnifyingglass, target: self, action: #selector(routeToSearch))
  
  // 옵저버를 등록해놓고 바꿔야함.
  lazy var notiNavigationBarButtonItem: UIBarButtonItem = .init(title: "알림", image: Style.Foundation.Icon.bell, target: self, action: #selector(routeToNoti))
  
  lazy var tableView: UITableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    $0.rowHeight = 60
    $0.register(DramaGroupCell.self, forCellReuseIdentifier: "DramaGroupCell")
    $0.backgroundColor = .clear
    $0.separatorStyle = .singleLine
  }
  
  var dataSource: [Section] = []
  var itemLists: [[TVShowEntity.Response]] = .init(repeating: [], count: 3)
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    callRequest()
    refresh()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //    callRequest()
    refresh()
  }
  
  // MARK: Configure
  override func configHierarchy() {
    view.addSubviews([tableView])
  }
  
  override func configView() {
    navigationItem.rightBarButtonItems = [notiNavigationBarButtonItem, searchNavigationBarButtonItem]
    navigationItem.title = "드라마 홈"
  }
  
  override func configLayout() {
    tableView.snp.makeConstraints {
      $0.horizontalEdges.verticalEdges.equalToSuperview()
    }
  }
}

extension DramaHomeViewController {
  func callRequest() {
    let group = DispatchGroup()
    isLoading = true
    
    group.enter()
    tvService.getPopularTVs() { res in
      switch res {
      case .success(let success):
        self.itemLists[0] = success?.results ?? []
        break
      case .failure(let error):
        break
      }
      group.leave()
    }
    
    group.enter()
    tvService.getTopRatedTVs() { res in
      switch res {
      case .success(let success):
        self.itemLists[1] = success?.results ?? []
        break
      case .failure(let error):
        break
      }
      group.leave()
    }
    
    group.enter()
    tvService.getTrendingTVs(timeWindow: .day) { res in
      switch res {
      case .success(let success):
        self.itemLists[2] = success?.results ?? []
        break
      case .failure(let error):
        break
      }
      group.leave()
    }
    
    group.notify(queue: .main){
      self.isLoading = false
      self.tableView.reloadData()
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
  
  @objc func routeToDetail(id: Int) {
    let vc = DramaDetailViewController(dramaId: id)
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: 섹션 모델
extension DramaHomeViewController {
  
  enum Section {
    case trend(MovieInfoModel)
    case topRated(MovieInfoModel)
    case popular(MovieInfoModel)
    
    var title: String {
      switch self {
      case .popular:
        return "인기있는"
      case .topRated:
        return "높은평점의"
      case .trend:
        return "트렌드의"
      }
    }
  }
  
  struct MovieInfoModel {
  }
}

// MARK: 테이블 뷰
extension DramaHomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(dataSource[indexPath.section].title)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch dataSource[safe: section] {
    case .popular, .topRated, .trend:
      return 1
    case .none:
      return 0
    }
  }
  
  /// 셀을 실질적으로 그리는 부분
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let section = dataSource[indexPath.section]
    
    switch section {
    case .popular, .topRated, .trend:
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "DramaGroupCell", for: indexPath) as! DramaGroupCell
      
      cell.collectionView.dataSource = self
      cell.collectionView.delegate = self
      cell.collectionView.tag = indexPath.section
      cell.collectionView.register(DramaDescriptionCell.self, forCellWithReuseIdentifier: "DramaDescriptionCell")
      cell.selectionStyle = .none
      cell.prepare(title: section.title)
      cell.collectionView.reloadData()
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 200 }
  
  func numberOfSections(in tableView: UITableView) -> Int { 3 }
  
  func refresh(){
    var popularModel: MovieInfoModel { .init() }
    var topRatedModel: MovieInfoModel { .init() }
    var trendModel: MovieInfoModel { .init() }
    
    let popularSection = Section.popular(popularModel)
    let topRatedSection = Section.topRated(topRatedModel)
    let trendSection = Section.trend(trendModel)
    
    self.dataSource = [popularSection, topRatedSection, trendSection]
    self.tableView.reloadData()
  }
}

// MARK: 컬렉션 뷰
extension DramaHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  // MARK: 델리게이트
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let tag = collectionView.tag
    let itemList = itemLists[tag]
    let item = itemList[indexPath.item]
    let dramaId = item.id
    routeToDetail(id: dramaId)
  }
  
  // MARK: 데이터 소스
  
  /// 섹션 아이템의 갯수
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let tag = collectionView.tag
    let itemList = itemLists[tag]
    return itemList.count
  }
  
  /// 아이템 사이즈
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: 200, height: 200)
  }
  
  /// 셀 아이템
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let tag = collectionView.tag
    let itemList = itemLists[tag]
    let item = itemList[indexPath.item]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DramaDescriptionCell", for: indexPath) as! DramaDescriptionCell
    
    cell.prepare(image: item.posterPath)
    return cell
  }
  
  static func setCollectionViewLayout() -> UICollectionViewLayout {
    .init()
  }
}

@available(iOS 17.0, *)
#Preview {
  DramaHomeViewController().wrapToNavVC()
}
