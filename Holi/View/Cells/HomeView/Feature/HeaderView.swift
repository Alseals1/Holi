//
//  CollectionReusableView.swift
//  Holi
//
//  Created by Alandis Seals on 11/16/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let kind = String(describing: HeaderView.self)
    static let reuseIdentifier = String(describing: HeaderView.self)
    static let nib = String(describing: HeaderView.self)
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func title(_ title: String){
        sectionTitle.text = title
    }
    
}
