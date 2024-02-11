//
//  MainTabViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import Then

class MainTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    
    let homeVC = DramaHomeViewController().then {
      $0.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.circle"), tag: 0)
    }
    
    let profileVC = UserProfileViewController().then {
      $0.tabBarItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "person.crop.circle"), tag: 1)
    }
    
    self.viewControllers = [homeVC.wrapToNavVC(), profileVC.wrapToNavVC()]
  }
}

extension MainTabBarController: UITabBarControllerDelegate {
  
}

@available(iOS 17.0, *)
#Preview {
  MainTabBarController()
}
