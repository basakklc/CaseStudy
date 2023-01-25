//
//  CustomCVCell.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import UIKit

class CustomCVCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var imgView: UIImageView?
    @IBOutlet weak var descLbl: UILabel?
    @IBOutlet weak var priceLbl: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeShadow()
    }
    
    func configure(model: DiscoverModel) {
        imgView?.sd_setImage(with: URL(string: model.imageURL))
        descLbl?.text = model.description
        priceLbl?.text = model.price
    }
    
    func makeShadow() {
        self.layer.cornerRadius = 3.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
    }
    
}
