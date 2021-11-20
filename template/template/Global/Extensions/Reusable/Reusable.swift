//
//  Reusable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
