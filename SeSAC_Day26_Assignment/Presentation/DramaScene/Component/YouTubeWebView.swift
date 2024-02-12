//
//  VideoWebView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import WebKit
import SnapKit
import Then

class YouTubeWebView: BaseView {
  
  // 계산 프로퍼티로 선언
  
  lazy var webView: WKWebView = .init().then {
    $0.navigationDelegate = self
  }
  var activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .large)
    indicator.hidesWhenStopped = true
    return indicator
  }()
}

extension YouTubeWebView {
  
  func loadVideo(withKey key: String?){
    guard let key, !key.isEmpty else { return }
    if let url = URL(string: "https://www.youtube.com/embed/\(key)") {
      webView.load(URLRequest(url: url))
    }
  }
  
  override func configView() {
    self.backgroundColor = Style.Foundation.Color.backgroundColor
  }
  
  override func configLayout() {
    webView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    activityIndicator.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
  }
  
  override func configHierarchy() {
    addSubviews([webView, activityIndicator])
  }
}

extension YouTubeWebView: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    activityIndicator.startAnimating()
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    activityIndicator.stopAnimating()
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    activityIndicator.stopAnimating()
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 17.0, *)
#Preview {
  UIViewPreview {
    YouTubeWebView().then{
      $0.loadVideo(withKey: "mrPZEVAthQs")
    }
  }
  .previewLayout(.sizeThatFits)
}

#endif
