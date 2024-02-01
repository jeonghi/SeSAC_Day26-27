//
//  AppAppearance.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import UIKit

final class AppAppearance {
  
  /// 전역 설정
  static func configure() {
    configureNavigationBarAppearance()
    configureTabBarAppearance()
  }
  
  /// 내비게이션 바 전역 설정
  static func configureNavigationBarAppearance() {
    
    let navigationBarAppearance = UINavigationBar.appearance()
    
    /// 백버튼 아이콘 색상을 흰색으로 설정
    navigationBarAppearance.tintColor = Style.Foundation.Color.tintColor
    
    /// 타이틀 텍스트 속성 굵게 설정
    let titleTextAttributes: [NSAttributedString.Key: Any] = [
      .font: Style.Foundation.Font.subheadline,
      .foregroundColor: Style.Foundation.Color.tintColor
    ]
    
    navigationBarAppearance.titleTextAttributes = titleTextAttributes
  }
  
  /// 탭 바 전역 설정
  static func configureTabBarAppearance() {
    
    let tabBarAppearance = UITabBar.appearance()
    
    /// 틴트 색상 설정
    tabBarAppearance.tintColor = Style.Foundation.Color.pointColor
    tabBarAppearance.unselectedItemTintColor = Style.Foundation.Color.unpointColor
    
    /// 투명도 설정
    tabBarAppearance.isTranslucent = true
  }
}
