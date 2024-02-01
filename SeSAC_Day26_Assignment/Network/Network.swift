//
//  Network.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import Foundation
import Alamofire

struct Network<T: TargetType> {
  
}

extension Network {
  func request<R>(_ target: T, responseType: R.Type, completion: @escaping ((Result<TVAPIResponse<R>?, NetworkError>) -> Void)) where R: Decodable, T: TargetType {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    guard let urlRequest = try? target.asURLRequest() else {
      print("문제")
      /// 에러 타입을 새로 정의해야하나?
      return
    }
    
    AF.request(urlRequest, interceptor: nil)
      .responseDecodable(of: TVAPIResponse<R>.self) { res in
        switch res.result {
        case .success(let success):
          completion(.success(success))
        case .failure(let error):
          dump(error)
          guard let data = res.data, let response = res.response else {
            completion(.failure(.unknown("알 수 없는 에러")))
            return
          }
          completion(.failure(NetworkError.checkError(data: data, response: response) ?? .unknown("알 수 없는 에러")))
      }
    }
  }
}
