//
//  CastingInfoCell.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/5/24.
//

import SnapKit
import Then
import UIKit
import Kingfisher

class CastingInfoCell: UICollectionViewCell {
  
  let nameLabel: UILabel = .init().then {
    $0.font = Style.Foundation.Font.caption
    $0.textColor = Style.Foundation.Color.secondary
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    prepare(name: nil)
  }
  
  func prepare(name: String?){
    nameLabel.text = name
  }
  
  override func configHierarchy() {
    contentView.addSubviews([nameLabel])
  }
  
  override func configView() {
  }
  
  override func configLayout() {
    nameLabel.snp.makeConstraints {
      $0.size.equalToSuperview()
    }
  }
}
