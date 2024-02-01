//
//  RequestParams.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/30/24.
//

import Foundation

enum RequestParams {
  case query(_ param: Encodable?)
  case body(_ param: Encodable?)
  case none
}
