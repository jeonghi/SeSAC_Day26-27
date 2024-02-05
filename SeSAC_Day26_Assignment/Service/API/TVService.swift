//
//  TVService.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation
import Alamofire

typealias TVShowBatchResponse = TMDbAPIResponse<[TVShowEntity.Response]>
typealias TVShowBatchResponseResult = Result<TMDbAPIResponse<[TVShowEntity.Response]>?, NetworkError>

typealias TVShowSingleResponse = TMDbAPIResponse<TVShowEntity.Response>
typealias TVShowSingleResponseResult = Result<TMDbAPIResponse<TVShowEntity.Response>?, NetworkError>

protocol TVServiceType {
  func getTrendingTVs(timeWindow: TVShowEntity.TimeWindow, language: String, completion: @escaping (TVShowBatchResponseResult) -> Void)
  
  func getPopularTVs(language: String, completion: @escaping (TVShowBatchResponseResult) -> Void)
  
  func getTopRatedTVs(language: String, completion: @escaping (TVShowBatchResponseResult) -> Void)
  
  func searchTV(query: String, language: String, completion: @escaping (TVShowSingleResponseResult) -> Void)
  
  func getTVDetails(id: Int, language: String, completion: @escaping (Result<TVShowEntity.Response?, NetworkError>) -> Void)
  
  func getTVRecommendations(id: Int, language: String, completion: @escaping (TVShowBatchResponseResult) -> Void)
  
  func getTVAggregateCredits(id: Int, language: String, completion: @escaping ((Result<AggregateCreditsEntity.Response?, NetworkError>) -> Void))
}

final class TVService: TVServiceType {
  
  static let shared = TVService()
  private let network = Network<TvAPI>()
  
  private init() {}
  
  func getTrendingTVs(timeWindow: TVShowEntity.TimeWindow, language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (TVShowBatchResponseResult) -> Void) {
    return network.requestUrlSession(.getTrandTVs(timeWindow: timeWindow.rawValue, language: language), responseType: TVShowBatchResponse.self, completion: completion)
  }
  
  func getPopularTVs(language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (TVShowBatchResponseResult) -> Void) {
    return network.requestUrlSession(.getPopularTVs(language: language), responseType: TVShowBatchResponse.self, completion: completion)
  }
  
  func getTopRatedTVs(language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (TVShowBatchResponseResult) -> Void) {
    return network.requestUrlSession(.getTopRatedTVs(language: language), responseType: TVShowBatchResponse.self, completion: completion)
  }
  
  func searchTV(query: String, language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (TVShowSingleResponseResult) -> Void) {
    return network.request(.searchTV(query: query, language: language), responseType: TVShowSingleResponse.self, completion: completion)
  }
  
  func getTVDetails(id: Int, language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (Result<TVShowEntity.Response?, NetworkError>) -> Void) {
    return network.request(.getTVDetails(id: id, language: language), responseType: TVShowEntity.Response.self, completion: completion)
  }
  
  func getTVRecommendations(id: Int, language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (TVShowBatchResponseResult) -> Void) {
    return network.request(.getTVRecommendations(id: id, language: language), responseType: TVShowBatchResponse.self, completion: completion)
  }
  
  func getTVAggregateCredits(id: Int, language: String = Locale.currentLanguageAndCountryCode, completion: @escaping (Result<AggregateCreditsEntity.Response?, NetworkError>) -> Void) {
//    return network.request(.getTVAggregateCredits(id: id, language: language), responseType: AggregateCreditsEntity.Response.self, completion: completion)
    return network.requestUrlSession(.getTVAggregateCredits(id: id, language: language), responseType: AggregateCreditsEntity.Response.self, completion: completion)
  }
}
