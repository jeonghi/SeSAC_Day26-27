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
  
  var detailInfo: String? {
    didSet {
      descriptionLabel.text = self.detailInfo
    }
  }
  
  lazy var backgroundImageView: PosterImageView = .init(self.imageUrl)
  lazy var foregroundImageView: PosterImageView = .init(self.imageUrl)
  
  lazy var movieDetailView: UIView = .init().then {
    $0.addSubviews([self.titleLabel, self.descriptionLabel])
  }
  
  var titleLabel: UILabel = .init().then {
    $0.textColor = Style.Foundation.Color.tintColor
    $0.numberOfLines = 1
  }
  
  var descriptionLabel: UILabel = .init().then {
    $0.font = Style.Foundation.Font.caption
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
      self.detailInfo = description
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
    addSubviews([backgroundImageView, blurEffectView, foregroundImageView, movieDetailView, label])
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
    
    movieDetailView.snp.makeConstraints {
      $0.verticalEdges.equalTo(foregroundImageView)
      $0.leading.equalTo(foregroundImageView.snp.trailing).offset(20)
      $0.trailing.equalTo(backgroundImageView)
        .inset(10)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(movieDetailView.snp.top)
      $0.horizontalEdges.equalToSuperview()
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.horizontalEdges.equalToSuperview()
      
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
      description: "누군가는 태어나고 누군가는 삶을 끝내는 탄생과 죽음이 공존하는, 인생의 축소판이라 불리는 병원에서 평범한 듯 특별한 하루하루를 살아가는 사람들과 눈빛만 봐도 알 수 있는 20년지기 친구들의 케미스토리를 담은 드라마",
      imageUrl: "https://image.tmdb.org/t/p/w500/fRbJHsykSRLbRYNrCyaP2YATeDG.jpg".toUrl()
    )
  }
  .previewLayout(.sizeThatFits)
}
#endif
