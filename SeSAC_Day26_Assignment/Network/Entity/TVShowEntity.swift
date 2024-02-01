//
//  TVShowEntity.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

enum TVShowEntity {
  
  struct Request: Encodable {
    let language: String
    let query: String
    let timeWindow: TimeWindow
  }
  
  struct Response: Decodable, Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let originCountry: [String]
    let originalName: String
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let firstAirDate, name: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
      case id
      case adult
      case backdropPath = "backdrop_path"
      case genreIDS = "genre_ids"
      case originCountry = "origin_country"
      case originalName = "original_name"
      case overview, popularity
      case posterPath = "poster_path"
      case firstAirDate = "first_air_date"
      case name
      case voteAverage = "vote_average"
      case voteCount = "vote_count"
    }
    
    /// 서버에서 받은 값을 그대로 사용하지 않고, 일부 제약조건을 추가하거나 값에 대한 변형을 하고싶을 때 사용 ex. 서버에서 null을 줄 때, 대체할 문자열을 추가하고 싶을 때
    init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<TVShowEntity.Response.CodingKeys> = try decoder.container(keyedBy: TVShowEntity.Response.CodingKeys.self)
      self.adult = try container.decode(Bool.self, forKey: TVShowEntity.Response.CodingKeys.adult)
      self.backdropPath = try container.decodeIfPresent(String.self, forKey: TVShowEntity.Response.CodingKeys.backdropPath) ?? ""
      self.genreIDS = try container.decode([Int].self, forKey: TVShowEntity.Response.CodingKeys.genreIDS)
      self.id = try container.decode(Int.self, forKey: TVShowEntity.Response.CodingKeys.id)
      self.originCountry = try container.decode([String].self, forKey: TVShowEntity.Response.CodingKeys.originCountry)
      self.originalName = try container.decode(String.self, forKey: TVShowEntity.Response.CodingKeys.originalName)
      self.overview = try container.decode(String.self, forKey: TVShowEntity.Response.CodingKeys.overview) ?? "아직 줄거리가 없어요 :("
      self.popularity = try container.decode(Double.self, forKey: TVShowEntity.Response.CodingKeys.popularity)
      self.posterPath = try container.decodeIfPresent(String.self, forKey: TVShowEntity.Response.CodingKeys.posterPath)
      self.firstAirDate = try container.decode(String.self, forKey: TVShowEntity.Response.CodingKeys.firstAirDate)
      self.name = try container.decode(String.self, forKey: TVShowEntity.Response.CodingKeys.name)
      self.voteAverage = try container.decode(Double.self, forKey: TVShowEntity.Response.CodingKeys.voteAverage)
      self.voteCount = try container.decode(Int.self, forKey: TVShowEntity.Response.CodingKeys.voteCount)
    }
  }
  
  enum TimeWindow: String, Encodable {
    case day
    case week
  }
}
