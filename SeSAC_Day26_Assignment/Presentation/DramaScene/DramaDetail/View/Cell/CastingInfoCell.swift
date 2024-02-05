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
  
  let roleNameLabel: UILabel = .init().then {
    $0.font = Style.Foundation.Font.caption
    $0.textColor = Style.Foundation.Color.tintColor
  }
  
  lazy var stackView: UIStackView = .init(arrangedSubviews: [self.nameLabel, self.roleNameLabel]).then {
    $0.axis = .vertical
    $0.alignment = .leading
    $0.distribution = .fill
    $0.spacing = 10
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
    prepare(name: nil, roleName: nil)
  }
  
  func prepare(name: String?, roleName: String?){
    nameLabel.text = name
    roleNameLabel.text = roleName
  }
  
  override func configHierarchy() {
    contentView.addSubviews([stackView])
  }
  
  override func configView() {
    
  }
  
  override func configLayout() {
    stackView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.horizontalEdges.equalToSuperview().inset(5)
    }
  }
}
