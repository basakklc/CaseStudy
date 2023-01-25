//
//  WithRateCell.swift
//  CaseStudy
//
//  Created by Başak on 1/22/23.
//

import UIKit

class WithRateCell: CustomCVCell {
    
    @IBOutlet weak var firstStarImgView: UIImageView!
    @IBOutlet weak var secondStarImgView: UIImageView!
    @IBOutlet weak var thirdStarImgView: UIImageView!
    @IBOutlet weak var fourthStarImgView: UIImageView!
    @IBOutlet weak var fifthStarImgView: UIImageView!
    var stars: [UIImageView]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stars = [firstStarImgView,secondStarImgView,thirdStarImgView,fourthStarImgView,fifthStarImgView]
    }
    
    func setModel(model: DiscoverModel) {
        super.configure(model: model)
        if let rate = model.ratePercentage { starConfigure(rate: rate ) }
    }
    
    func starConfigure(rate: Int)  {
        let amount = rate / 20
        for i in 0...(amount - 1) {
            stars?[i].image = UIImage(named: "FilledStar")
        }
        for i in (amount)...4 {
            stars?[i].image = UIImage(named: "BlankStar")
        }
    }
}
