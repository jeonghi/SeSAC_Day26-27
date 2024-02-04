//
//  PosterView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/3/24.
//

import UIKit
import Then
import SnapKit
import Kingfisher

class PosterView: UIView {
  
  var imageUrl: URL? {
    didSet {
      backgroundImageView.imageUrl = self.imageUrl
      foregroundImageView.imageUrl = self.imageUrl
    }
  }
  
  var movieTitle: String? {
    didSet {
      titleLabel.attributedText = makeTitleLabelAttributedString()
    }
  }
  var movieDate: Int? {
    didSet {
      titleLabel.attributedText = makeTitleLabelAttributedString()
    }
  }
  
  lazy var backgroundImageView: PosterImageView = .init(self.imageUrl)
  lazy var foregroundImageView: PosterImageView = .init(self.imageUrl)
  
  var titleLabel: UILabel = .init().then {
    $0.textColor = Style.Foundation.Color.tintColor
    $0.numberOfLines = 0
  }
  
  var label: PosterLabel = .init().then {
    $0.text = "TV"
  }
  
  // 블러 효과를 추가하기 위한 UIVisualEffectView 프로퍼티
  lazy var blurEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = self.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return blurEffectView
  }()
  
  convenience init(title: String, year: Int, description: String, imageUrl: URL?) {
    self.init(frame: .zero)
    configBase()
    DispatchQueue.main.async {
      self.imageUrl = imageUrl
      self.movieTitle = title
      self.movieDate = year
    }
  }
  
  override var intrinsicContentSize: CGSize {
    super.intrinsicContentSize
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  

  override func configHierarchy() {
    addSubviews([backgroundImageView, blurEffectView, foregroundImageView, titleLabel, label])
  }
  
  override func configLayout() {
    backgroundImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    label.snp.makeConstraints {
      $0.bottom.trailing.equalTo(backgroundImageView).inset(10)
    }
    
    foregroundImageView.snp.makeConstraints {
      $0.bottom.leading.equalTo(backgroundImageView).inset(10)
      $0.width.equalTo(160)
      $0.height.equalTo(220)
      $0.top.greaterThanOrEqualTo(backgroundImageView.snp.bottom).offset(10)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(foregroundImageView.snp.top)
      $0.leading.equalTo(foregroundImageView.snp.trailing).offset(20)
      $0.trailing.equalTo(backgroundImageView).inset(10)
    }
  }

  override func configView() {
  }
  
  private func makeTitleLabelAttributedString() -> NSMutableAttributedString {
    /// 각 부분에 대한 폰트를 정의
    let titleFont = Style.Foundation.Font.headline
    let dateFont = Style.Foundation.Font.subheadline
    
    /// NSAttributedString의 각 부분에 대한 속성을 정의
    let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont]
    let dateAttributes: [NSAttributedString.Key: Any] = [.font: dateFont]

    /// NSAttributedString을 조합하여 전체 문자열을 생성
    let attributedText = NSMutableAttributedString(string: "\(self.movieTitle ?? "")", attributes: titleAttributes)
    attributedText.append(NSAttributedString(string: "(\(self.movieDate ?? 0))", attributes: dateAttributes))
    return attributedText
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 17.0, *)
#Preview {
  UIViewPreview {
    PosterView(
      title: "방이동 먹자 골목", 
      year: 2014,
      description: "dfdaf",
      imageUrl: "https://image.tmdb.org/t/p/w500/fRbJHsykSRLbRYNrCyaP2YATeDG.jpg".toUrl()
    )
  }
  .previewLayout(.sizeThatFits)
}
#endif
