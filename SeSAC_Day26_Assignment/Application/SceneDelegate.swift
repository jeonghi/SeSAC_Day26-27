//
//  SceneDelegate.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    /// 코드를 통해 앱 시작점 설정
    guard let scene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: scene)
    
    /// 조건에 따라 분기
    /// 1) 아직 프로필 설정하지 않은 경우 -> 온보딩
    /// 2) 프로필 설정한 경우 -> 메인 탭
    
    let rootViewController: UIViewController = UserDefaultManager.isFirstLaunch ? OnboardingViewController() : DramaHomeViewController()
    let navigationVC: UINavigationController = .init(rootViewController: rootViewController)
    window?.rootViewController = navigationVC // 특정 ViewController
    window?.makeKeyAndVisible()
  }
}

