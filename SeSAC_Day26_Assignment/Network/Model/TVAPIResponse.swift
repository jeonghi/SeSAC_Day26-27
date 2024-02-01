//
//  APIResponse.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

struct TVAPIResponse<T: Decodable>: Decodable {
  let page: Int
  let results: T
  let totalPages: Int
  let totalResults: Int
  
  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}
