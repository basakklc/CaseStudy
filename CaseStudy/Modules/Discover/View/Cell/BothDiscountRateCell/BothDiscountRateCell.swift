//
//  BothDiscountRateCell.swift
//  CaseStudy
//
//  Created by Başak on 1/23/23.
//

import UIKit

class BothDiscountRateCell: CustomCVCell {
    
    @IBOutlet weak var firstStarImgView: UIImageView!
    @IBOutlet weak var secondStarImgView: UIImageView!
    @IBOutlet weak var thirdStarImgView: UIImageView!
    @IBOutlet weak var fourthStarImgView: UIImageView!
    @IBOutlet weak var fifthStarImgView: UIImageView!
    @IBOutlet weak var discountLbl: UILabel!
    
    var stars: [UIImageView]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stars = [firstStarImgView,secondStarImgView,thirdStarImgView,fourthStarImgView,fifthStarImgView]
    }
    
    func setModel(model: DiscoverModel) {
        super.configure(model: model)
        discountLbl.text = model.discount
        if let rate = model.ratePercentage { starConfigure(rate: rate ) }
    }
    
    func starConfigure(rate: Int)  {
        let amount = rate / 20
        for i in 0...(amount - 1){
            stars?[i].image = UIImage(named: "FilledStar")
        }
    }
}
