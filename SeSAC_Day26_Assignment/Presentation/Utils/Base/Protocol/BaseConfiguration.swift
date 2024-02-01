//
//  BaseConfiguration.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 1/31/24.
//

import Foundation

@objc protocol BaseConfiguration: AnyObject {
  @objc optional func configView()
  @objc optional func configLayout()
  @objc optional func configHierarchy()
}

extension BaseConfiguration where Self: NSObject {
  func configBase() {
    configHierarchy?()
    configView?()
    configLayout?()
  }
}
