//
//  TVShowEntity.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

enum TVShowEntity {
  
  struct Request: Encodable {
  }
  
  struct Response: Decodable {
    let backdrop_path: String?
    let first_air_date: String
    let genre_ids: [Int]
    let id: Int
    let name: String
    let origin_country: [String]
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let vote_average: Double
    let vote_count: Int
  }
  
  enum TimeWindow: String {
    case day
    case week
  }
}
