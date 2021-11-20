//
//  TableViewCellUsable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

import UIKit

protocol TableViewCellUsable: AnyObject {
    static func registerCell(at tableView: UITableView)
    static func dequeueCell(from tableView: UITableView) -> Self
    static func dequeueCell(from tableView: UITableView, indexPath: IndexPath) -> Self
}

extension TableViewCellUsable where Self: UITableViewCell {
    static func registerCell(at tableView: UITableView) {
        let nib = UINib(nibName: self.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueCell(from tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as? Self else {
            fatalError("Dequeue TableViewCell Error! \(self.reuseIdentifier)")
        }
        return cell
    }
    
    static func dequeueCell(from tableView: UITableView, indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Dequeue TableViewCell Error! \(self.reuseIdentifier)")
        }
        return cell
    }
}
