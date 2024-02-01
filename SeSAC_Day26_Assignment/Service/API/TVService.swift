//
//  TVService.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation
import Alamofire

typealias TVShowResponseResult = Result<TVAPIResponse<[TVShowEntity.Response]>?, NetworkError>
typealias TVShowDetailResponseResult = Result<TVAPIResponse<TVShowEntity.Response>?, NetworkError>

protocol TVServiceType {
    func getTrendingTVs(timeWindow: TVShowEntity.TimeWindow, completion: @escaping (TVShowResponseResult) -> Void)
    func getPopularTVs(language: String, completion: @escaping (TVShowResponseResult) -> Void)
    func getTopRatedTVs(language: String, completion: @escaping (TVShowResponseResult) -> Void)
    func searchTV(query: String, language: String, completion: @escaping (TVShowResponseResult) -> Void)
    func getTVDetails(id: Int, language: String, completion: @escaping (TVShowDetailResponseResult) -> Void)
    func getTVRecommendations(id: Int, language: String, completion: @escaping (TVShowResponseResult) -> Void)
}

final class TVService: TVServiceType {
    static let shared = TVService()
    private let network = Network<TvAPI>()
    
    private init() {}
    
    func getTrendingTVs(timeWindow: TVShowEntity.TimeWindow, completion: @escaping (TVShowResponseResult) -> Void) {
        let language = Locale.currentLanguageAndCountryCode
        requestTVData(.getTrandTVs(timeWindow: timeWindow.rawValue, language: language), responseType: [TVShowEntity.Response].self, completion: completion)
    }
    
    func getPopularTVs(language: String, completion: @escaping (TVShowResponseResult) -> Void) {
        requestTVData(.getPopularTVs(language: language), responseType: [TVShowEntity.Response].self, completion: completion)
    }
    
    func getTopRatedTVs(language: String, completion: @escaping (TVShowResponseResult) -> Void) {
        requestTVData(.getTopRatedTVs(language: language), responseType: [TVShowEntity.Response].self, completion: completion)
    }
    
    func searchTV(query: String, language: String, completion: @escaping (TVShowResponseResult) -> Void) {
        requestTVData(.searchTV(query: query, language: language), responseType: [TVShowEntity.Response].self, completion: completion)
    }
    
    func getTVDetails(id: Int, language: String, completion: @escaping (TVShowDetailResponseResult) -> Void) {
        requestTVData(.getTVDetails(id: id, language: language), responseType: TVShowEntity.Response.self, completion: completion)
    }
    
    func getTVRecommendations(id: Int, language: String, completion: @escaping (TVShowResponseResult) -> Void) {
        requestTVData(.getTVRecommendations(id: id, language: language), responseType: [TVShowEntity.Response].self, completion: completion)
    }
    
    private func requestTVData<T>(_ target: TvAPI, responseType: T.Type, completion: @escaping (Result<TVAPIResponse<T>?, NetworkError>) -> Void) where T: Decodable {
        network.request(target, responseType: responseType) { result in
            completion(result)
        }
    }
}
