//
//  OnlyPricedCell.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import UIKit
import SDWebImage

class OnlyPricedCell: CustomCVCell {
    
    @IBOutlet weak var oldPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setModel(model: DiscoverModel) {
        super.configure(model: model)
        guard let oldPriceLbl = oldPriceLbl else { return }
        oldPriceLbl.attributedText = model.oldPrice.createAttributedString(stringToStrike: model.oldPrice)
    }
}
