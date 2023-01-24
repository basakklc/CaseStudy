//
//  WithDiscountCell.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import UIKit

class WithDiscountCell: CustomCVCell {
    
    @IBOutlet weak var discountLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setModel(model: DiscoverModel) {
        super.configure(model: model)
        discountLbl.text = model.discount
    }
}
