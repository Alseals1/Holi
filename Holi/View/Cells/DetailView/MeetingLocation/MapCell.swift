//
//  MapCell.swift
//  Holi
//
//  Created by Alandis Seals on 11/28/22.
//

import UIKit

class MapCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: MapCell.self)
    static let kind = String(describing: MapCell.self)
    static let nib = UINib(nibName: String(describing: MapCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
