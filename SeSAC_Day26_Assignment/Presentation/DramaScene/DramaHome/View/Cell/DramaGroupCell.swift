//
//  DramaGroupCell.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import Kingfisher
import SnapKit
import UIKit
import Then

class DramaGroupCell: UITableViewCell {
  
  let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: configureCollectionViewLayout()
  ).then {
    $0.backgroundColor = Style.Foundation.Color.clear
    $0.isPagingEnabled = true
    $0.showsVerticalScrollIndicator = false
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configBase()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    prepare(title: nil)
  }
  
  func prepare(title: String?){
  }
  
  override func configLayout() {
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(contentView.safeAreaLayoutGuide)
      $0.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
      $0.bottom.equalTo(contentView.safeAreaLayoutGuide)
    }
  }
  
  override func configHierarchy() {
    contentView.addSubviews([collectionView])
  }
  
  override func configView() {
    backgroundColor = .clear
    contentView.backgroundColor = .clear
  }
  
  static func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
    .init().then {
      $0.itemSize = CGSize(width: 120, height: 160)
      $0.minimumLineSpacing = 10
      $0.minimumInteritemSpacing = 0
      $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      $0.scrollDirection = .horizontal
    }
  }
}
