//
//  CollectionViewCellUsable.swift
//  template
//
//  Created by taehy.k on 2021/11/19.
//

import UIKit

public enum SupplementaryType {
    case header
    case footer
    var identifier: String {
        switch self {
        case .header:   return UICollectionView.elementKindSectionHeader
        case .footer:   return UICollectionView.elementKindSectionFooter
        }
    }
}

extension UICollectionReusableView: Reusable, SupplementaryType {}

protocol CollectionViewCellUsable: AnyObject {
    static func registerCell(at collectionView: UICollectionView)
    static func dequeueCell(from collectionView: UICollectionView, indexPath: IndexPath) -> Self
}

extension CollectionViewCellUsable where Self: UICollectionViewCell {
    static func registerCell(at collectionView: UICollectionView) {
        let nib = UINib(nibName: self.nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    static func registerView(at collectionView: UICollectionView, _ ofKind: SupplementaryType) {
        let nib = UINib(nibName: self.nibName, bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: ofKind.identifier, withReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueCell(from collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? Self else {
            fatalError("Dequeue TableViewCell Error! \(self.reuseIdentifier)")
        }
        return cell
    }
    
    
    
    static func dequeueHeaderView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}

