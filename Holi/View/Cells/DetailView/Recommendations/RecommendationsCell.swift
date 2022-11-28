//
//  RecommendationsCell.swift
//  Holi
//
//  Created by Alandis Seals on 11/28/22.
//

import UIKit

class RecommendationsCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: RecommendationsCell.self)
    static let kind = String(describing: RecommendationsCell.self)
    static let nib = UINib(nibName: String(describing: RecommendationsCell.self), bundle: nil)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  /*  func setup(_ image: String, _ imageName: String) {
        
        imageView.image = UIImage(named: image)
        imageLbl.text = imageName
        
    }*/

}
