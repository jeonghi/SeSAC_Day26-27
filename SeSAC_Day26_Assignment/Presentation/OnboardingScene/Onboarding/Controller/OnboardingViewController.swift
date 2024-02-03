//
//  OnboardingViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/3/24.
//

import UIKit
import Then
import SnapKit

class OnboardingViewController: BaseViewController {
  
  lazy var startButton: UIButton = .init().then {
    $0.setTitle("시작하기", for: .normal)
    $0.applyStyle(.primary, isEnabled: true)
    $0.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
  }
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: Action
  @objc func tappedStartButton(_ sender: UIButton) {
    routeToHome()
  }
}

// MARK: Navigator
extension OnboardingViewController {
  @objc func routeToHome(){
    let vc = DramaHomeViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension OnboardingViewController {
  override func configView() {
  }
  
  override func configLayout() {
    startButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalTo(55)
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  override func configHierarchy() {
    view.addSubviews([startButton])
  }
}

@available(iOS 17.0, *)
#Preview {
  OnboardingViewController().wrapToNavVC()
}
