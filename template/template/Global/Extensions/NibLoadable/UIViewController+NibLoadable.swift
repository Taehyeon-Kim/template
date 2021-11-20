//
//  UIViewController+NibLoadable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

import UIKit

extension UIViewController: NibLoadable {
    
    public static var nibBundle: Bundle? {
        return Bundle(for: self)
    }
    
    public static var nibName: String {
        return "\(self)"
    }
    
    public static func instanceFromNib() -> Self {
        return Self.init(nibName: nibName, bundle: nibBundle)
    }
}
