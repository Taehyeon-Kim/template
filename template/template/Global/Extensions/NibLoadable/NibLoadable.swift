//
//  NibLoadable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

import Foundation

public protocol NibLoadable: AnyObject {
    static var nibBundle: Bundle? { get }
    static var nibName: String { get }
    static func instanceFromNib() -> Self
}
