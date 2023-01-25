//
//  ComingSoonView.swift
//  CaseStudy
//
//  Created by Başak on 24.01.2023.
//

import UIKit

class ComingSoonView: UIView {
//    @IBOutlet weak var comingSoonLbl: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(for: ComingSoonView.className)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: ComingSoonView.className)
    }
    
    func commonInit(for customViewName: String) {
        let view = loadNib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundColor = UIColor.clear
        addSubview(view)
    }
}
