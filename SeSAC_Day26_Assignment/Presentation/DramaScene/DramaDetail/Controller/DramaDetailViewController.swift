//
//  DramaDetailViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit
import Then
import SnapKit

final class DramaDetailViewController: BaseViewController {
  
  // MARK: Dependency
  var tvService: TVService { AppService.apiService.tvService }
  
  var dramaId: Int?
  
  var posterImage: PosterView = PosterView()
  
  var sections: [Section] = Section.allCases
  
  var movieList: [TVShowEntity.Response] = []
  
  lazy var tableView: UITableView = .init().then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .clear
    $0.register(DramaGroupCell.self, forCellReuseIdentifier: "DramaGroupCell")
  }
  
  override func loadView() {
    super.loadView()
  }
  
  init(dramaId: Int? = nil) {
    self.dramaId = dramaId
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    if let dramaId { callRequest(dramaId) }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  
  // MARK: Base Configuration
  override func configHierarchy() {
    view.addSubviews([tableView, posterImage])
  }
  
  override func configLayout() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(posterImage.snp.bottom)
      $0.horizontalEdges.bottom.equalToSuperview()
    }
    posterImage.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalToSuperview().dividedBy(3)
    }
  }
  
  override func configView() {
    navigationItem.title = "드라마 상세보기"
  }
}

// MARK: 네트워크
extension DramaDetailViewController {
  var callRequest: (Int) -> Void {
    {
      self.isLoading = true
      let group = DispatchGroup()
      
      group.enter()
      self.tvService.getTVDetails(id: $0) { res in
        switch res {
        case .success(let success):
          let posterPath = success?.posterPath ?? ""
          self.posterImage.imageUrl = "\(AppConfiguration.shared.imageBaseURL)\(posterPath)".toUrl()
          self.posterImage.movieTitle = success?.originalName
          self.posterImage.detailInfo = success?.overview
          self.posterImage.movieDate = success?.firstAirDate.extractYear()
          break
        case .failure(let error):
          break
        }
        group.leave()
      }
      
      group.enter()
      self.tvService.getTVAggregateCredits(id: $0) { res in
        switch res {
        case .success(let success):
          break
        case .failure(let error):
          break
        }
        group.leave()
      }
      
      group.enter()
      self.tvService.getTVRecommendations(id: $0) { res in
        switch res {
        case .success(let success):
          self.movieList = success?.results ?? []
          self.tableView.reloadData()
          break
        case .failure(let error):
          print(error)
          break
        }
        group.leave()
      }
      
      group.notify(queue: .main){
        self.isLoading = false
      }
    }
  }
}

// MARK: 테이블 뷰
extension DramaDetailViewController: UITableViewDelegate, UITableViewDataSource {
  
  // MARK: - UITableViewDataSource
  /// 섹션의 갯수
  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.allCases.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    200
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    if(sections[section] == .recommend){
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "DramaGroupCell") as? DramaGroupCell else {
        return .init()
      }
      cell.collectionView.dataSource = self
      cell.collectionView.delegate = self
      cell.collectionView.register(DramaDescriptionCell.self, forCellWithReuseIdentifier: "DramaDescriptionCell")
      return cell
    }
    return .init()
  }
  
  // MARK: - UITableViewDelegate
  
  /// 섹션 헤더 높이 설정
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  /// 섹션 헤더 뷰 설정
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = UIColor.clear
    
    let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.size.width, height: 30))
    headerLabel.font = Style.Foundation.Font.title2
    headerLabel.textColor = Style.Foundation.Color.secondary
    headerLabel.text = "\(sections[section].rawValue)"
    headerLabel.backgroundColor = UIColor.clear
    
    headerView.addSubview(headerLabel)
    return headerView
  }
  
  enum Section: String, CaseIterable {
    case country = "PRODUCTION COUNTRY" // 영화 제작한 나라
    case casting = "출연진" // 캐스팅 정보
    case recommend = "비슷한 드라마" // 추천
  }
}

extension DramaDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    movieList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    .init(width: 200, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = movieList[indexPath.item]
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DramaDescriptionCell", for: indexPath) as? DramaDescriptionCell else {
      return .init()
    }
    cell.prepare(image: item.posterPath)
    return cell
  }
}

@available(iOS 17.0, *)
#Preview {
  DramaDetailViewController(dramaId: 96102).wrapToNavVC()
}
