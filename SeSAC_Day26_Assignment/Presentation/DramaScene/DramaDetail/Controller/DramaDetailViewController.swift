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
  
  var posterImage: PosterView = PosterView(
    title: "방이동 먹자 골목", year: 2014, description: "dfdaf",
    imageUrl: "https://image.tmdb.org/t/p/w500/fRbJHsykSRLbRYNrCyaP2YATeDG.jpg".toUrl()
  )
  
  lazy var tableView: UITableView = .init().then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .clear
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
      $0.edges.equalToSuperview()
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
          print(success)
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
          print(success?.cast)
          break
        case .failure(let error):
          print(error)
          break
        }
        group.leave()
      }
      
      group.enter()
      self.tvService.getTVRecommendations(id: $0) { res in
        switch res {
        case .success(let success):
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
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    headerLabel.text = "Section \(section)"
    headerLabel.backgroundColor = UIColor.clear
    
    headerView.addSubview(headerLabel)
    return headerView
  }
  
  enum Section: CaseIterable {
    case movie // 영화 헤더
    case country // 영화 제작한 나라
    case casting // 캐스팅 정보
    case recommend // 추천
  }
}

@available(iOS 17.0, *)
#Preview {
  DramaDetailViewController(dramaId: 96102).wrapToNavVC()
}
