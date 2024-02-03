//
//  BasePageViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/2/24.
//

import UIKit

class BasePageViewController: UIPageViewController {
  
  private var _pageViewControllerList: [UIViewController] = []
  var pageViewControllerList: [UIViewController] {
      _pageViewControllerList
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
    super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configBase()
  }
  
  private func configBase() {
    _pageViewControllerList = createPageViewController()
    configurePageViewController()
  }
  
  func createPageViewController() -> [UIViewController] {
    .init()
  }
  
  func configurePageViewController(){
    guard let firstVC = pageViewControllerList.first else { return }
    setViewControllers([firstVC], direction: .forward, animated: true)
  }
}
