//
//  RecommendedCell.swift
//  Holi
//
//  Created by Alandis Seals on 11/16/22.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: RecommendedCell.self)
    static let kind = String(describing: RecommendedCell.self)
    static let nib = UINib(nibName: String(describing: RecommendedCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
