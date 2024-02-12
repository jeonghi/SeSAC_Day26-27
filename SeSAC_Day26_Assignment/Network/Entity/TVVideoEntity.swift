//
//  TVVideoEntity.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/12/24.
//

import Foundation

// MARK: - Welcome

enum TVVideoEntity {
  
  struct Request: Encodable {
    var language: String?
  }
  
  struct Response: Decodable {
    let id: Int // 드라마 id
    let results: [Video]?
  }
  
  struct Video: Decodable {
    let iso639_1, iso3166_1, name, key: String
    let site: String?
    let size: Int?
    let type: String?
    let official: Bool?
    let publishedAt, id:  String?
    
    enum CodingKeys: String, CodingKey {
      case iso639_1 = "iso_639_1"
      case iso3166_1 = "iso_3166_1"
      case name, key, site, size, type, official
      case publishedAt = "published_at"
      case id
    }
  }
  
}
