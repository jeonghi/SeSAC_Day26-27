//
//  CountryInfoCell.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/5/24.
//

import SnapKit
import Then
import UIKit
import Kingfisher

class CountryInfoCell: UITableViewCell {
  
  let uiLabel: UILabel = .init().then {
    $0.font = Style.Foundation.Font.caption
    $0.textColor = Style.Foundation.Color.tintColor
    $0.textAlignment = .left
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configBase()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configBase()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    prepare(countryName: nil)
  }
  
  func prepare(countryName: String?){
    uiLabel.text = countryName
  }
  
  override func configHierarchy() {
    contentView.addSubviews([uiLabel])
  }
  
  override func configView() {
    
  }
  
  override func configLayout() {
    uiLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
