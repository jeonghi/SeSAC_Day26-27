//
//  TargetType.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import Alamofire
import Foundation

protocol TargetType: URLRequestConvertible {
  var baseURL: String { get }
  var method: HTTPMethod { get }
  var path: String { get }
  var params: RequestParams { get }
}

extension TargetType {
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL()
    var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    
    /// 일단 임시 방편... 시간날때 interceptor 로직 분리시켜야함.
    /// 으악 추상화는 너무 으려워 0 ~ 0
    urlRequest.setValue("\(AuthenticationType.bearer.rawValue) \(AppConfiguration.shared.accessToken)", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
    
    switch params {
    case .query(let request):
      let params = request?.toDictionary() ?? [:]
      let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
      var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
      components?.queryItems = queryParams
      urlRequest.url = components?.url
    case .body(let request):
      let params = request?.toDictionary() ?? [:]
      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
    case .none:
      break
    }
    
    return urlRequest
  }
}
