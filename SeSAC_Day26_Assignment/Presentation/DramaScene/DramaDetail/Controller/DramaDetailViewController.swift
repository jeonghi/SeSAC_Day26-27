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

  var posterImage = PosterImageView(frame: .zero)
  
  override func loadView() {
    super.loadView()
    self.view = UIView().then{$0.backgroundColor = .black}
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
    view.addSubview(posterImage)
  }
  
  override func configLayout() {
  }
  
  override func configView() {
    navigationItem.title = "드라마 상세보기"
  }
}

extension DramaDetailViewController {
  var callRequest: (Int) -> Void {
    {
      self.isLoading = true
      let group = DispatchGroup()
      
      group.enter()
      self.tvService.getTVDetails(id: $0) { res in
        switch res {
        case .success(let success):
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
          break
        case .failure(let error):
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

@available(iOS 17.0, *)
#Preview {
  DramaDetailViewController(dramaId: 96102).wrapToNavVC()
}
