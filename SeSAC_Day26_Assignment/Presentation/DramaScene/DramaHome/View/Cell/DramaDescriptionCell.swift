//
//  DramaDescriptionCell.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import SnapKit
import Then
import UIKit
import Kingfisher

class DramaDescriptionCell: UICollectionViewCell {
  
  let posterImageView: PosterImageView = .init(frame: .zero)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    prepare(image: nil)
  }
  
  func prepare(image: String?){
    let url = "\(AppConfiguration.shared.imageBaseURL)/\(image ?? "")".toUrl()
    posterImageView.kf.setImage(with: url)
  }
  
  override func configHierarchy() {
    contentView.addSubviews([posterImageView])
  }
  
  override func configView() {
    contentView.backgroundColor = .white
  }
  
  override func configLayout() {
    posterImageView.snp.makeConstraints {
      $0.size.equalToSuperview()
    }
  }
}
