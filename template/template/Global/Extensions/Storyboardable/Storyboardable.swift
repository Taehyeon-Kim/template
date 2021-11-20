//
//  Storyboardable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

import UIKit

protocol Storyboardable: AnyObject {
    static var storyboardName: String { get }
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        return String(describing: self)
    }
    
    static func instanceFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyboardName)")
        }

        return vc
    }
}
