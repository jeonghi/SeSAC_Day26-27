//
//  PagerUsingUIPageVC.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/2/24.
//

import UIKit

class PagerUsingUIPageVC: BasePageViewController {
  
  // 1) 현재 컨텐츠 뷰 컨트롤러를 설정
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func createPageViewController() -> [UIViewController] {
    [PageVC1(), PageVC2(), PageVC3()]
  }
  
  override func configurePageViewController() {
    super.configurePageViewController()
    dataSource = self
  }
}

class PageVC1: BaseViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .green
  }
}
class PageVC2: BaseViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
  }
}
class PageVC3: BaseViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
  }
}

// MARK: Page Content 제공하기 (DataSource)
extension PagerUsingUIPageVC: UIPageViewControllerDataSource {
  
  // MARK: View controller 들을 제공하기
  
  /// 현재 뷰컨의 이전 페이지 아이템 뷰컨을 반환
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let idx = pageViewControllerList.firstIndex(of: viewController) else { return nil }
    let beforeIdx = idx - 1
    return beforeIdx < 0 ? nil : pageViewControllerList[beforeIdx]
  }
  
  /// 현재 뷰컨의 다음 페이지 아이템 뷰컨을 반환
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let idx = pageViewControllerList.firstIndex(of: viewController) else { return nil }
    let afterIdx = idx + 1
    return afterIdx > pageViewControllerList.count - 1 ? nil : pageViewControllerList[afterIdx]
  }
  
  // MARK: Page Indicator 지원하는 방법
  
  /// page indicator 에 반영할 item의 갯수 반환 (몇개 표시할껀데?)
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return pageViewControllerList.count
  }
  
  /// page indicator 에 반영할 선택된 item의 index
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let first = viewControllers?.first, let index = pageViewControllerList.firstIndex(of: first) else { return 0 }
    return index
  }
}

// MARK:
extension PagerUsingUIPageVC: UIPageViewControllerDelegate {}

@available(iOS 17, *)
#Preview {
//  PagerUsingUIPageVC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [:]).wrapToNavVC()
  PagerUsingUIPageVC().wrapToNavVC()
}
