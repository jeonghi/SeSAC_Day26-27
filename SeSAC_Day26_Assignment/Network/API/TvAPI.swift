//
//  PopularAPI.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import Foundation
import Alamofire

enum TvAPI {
  case getTrandTVs(timeWindow: String, language: String)
  case getPopularTVs(language: String)
  case getTopRatedTVs(language: String)
  case searchTV(query: String, language: String)
  case getTVDetails(id: Int, language: String)
  case getTVRecommendations(id: Int, language: String)
  case getTVAggregateCredits(id: Int, language: String)
  case getTVVideos(id: Int, language: String)
}

extension TvAPI: TargetType {

  var baseURL: String { return AppConfiguration.shared.baseURL }
  
  var method: HTTPMethod { return .get }
  
  var path: String {
    switch self {
    case let .getTrandTVs(timeWindow, _ ):
      return "/trending/tv/\(timeWindow)"
    case .getTopRatedTVs:
      return "/tv/top_rated"
    case .getPopularTVs:
      return "/tv/popular"
    case .searchTV:
      return "/search/tv"
    case let .getTVDetails(id, _):
      return "/tv/\(id)"
    case let .getTVRecommendations(id, _):
      return "/tv/\(id)/recommendations"
    case let .getTVAggregateCredits(id, _):
      return "/tv/\(id)/aggregate_credits"
    case let .getTVVideos(id, _):
      return "/tv/\(id)/videos"
    }
  }
  
  var params: RequestParams {
    switch self {
    case .getTrandTVs:
      return .none
    case .getPopularTVs(let language),
         .getTopRatedTVs(let language),
         .getTVDetails(_, let language),
         .getTVRecommendations(_, let language),
         .getTVAggregateCredits(_, let language),
         .getTVVideos(_, let language):
      return .query(["language": language])
    case let .searchTV(query, language):
      return .query(["language": language, "query": query])
    }
  }
  
  var headers: HTTPHeaders {
    [HTTPHeaderField.authentication.rawValue: "\(AuthenticationType.bearer.rawValue) \(AppConfiguration.shared.accessToken)"]
  }
}
