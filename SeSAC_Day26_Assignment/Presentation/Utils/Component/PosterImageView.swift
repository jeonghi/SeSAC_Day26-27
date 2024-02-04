//
//  DramaPosterImageView.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/1/24.
//

import UIKit

class PosterImageView: UIImageView {
  
  var imageUrl: URL? {
    didSet {
      loadImage()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// URL을 전달인자로 받는 새로운 초기화 메소드
  convenience init(_ url: URL?) {
    self.init(frame: .zero)
    configBase()
    DispatchQueue.main.async {
      self.imageUrl = url
    }
  }
  
  override func configView() {
    backgroundColor = .lightGray
    contentMode = .scaleAspectFill
    layer.cornerRadius = 12
    layer.cornerCurve = .continuous
    clipsToBounds = true
  }
  
  private func loadImage() {
    guard let url = imageUrl else { return }
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        self?.image = image
      }
    }.resume()
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 17.0, *)
#Preview {
  UIViewPreview {
    PosterImageView("https://image.tmdb.org/t/p/w500/fRbJHsykSRLbRYNrCyaP2YATeDG.jpg".toUrl())
  }
  .previewLayout(.sizeThatFits)
}
#endif
