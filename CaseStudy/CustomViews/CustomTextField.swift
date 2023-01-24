//
//  CustomTextField.swift
//  CaseStudy
//
//  Created by Başak on 1/21/23.
//

import UIKit
import RxCocoa
import RxSwift

enum TextFieldType {
    case email
    case password
}

class CustomTextField: UITextField , UITextFieldDelegate {
    
    let border = CALayer()
    var floatingLabelHeight: CGFloat = 12 // Default height
    let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    var type: TextFieldType = .email
    var isAdded = false
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero)
    
    let disposeBag = DisposeBag()

    @IBInspectable open var lineColor : UIColor = UIColor.black {
        didSet{ border.borderColor = lineColor.cgColor }
    }

    @IBInspectable open var selectedLineColor : UIColor = UIColor.black { didSet{ } }
    
    @IBInspectable var _placeholder: String?
    
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.gray {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont(name: "Helvetica-Bold", size: 12)! {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }

    @IBInspectable open var lineHeight : CGFloat = CGFloat(1.0) {
        didSet{
            border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        }
    }

    required init?(coder aDecoder: (NSCoder?)) {
        super.init(coder: aDecoder!)
        self.delegate=self
        border.borderColor = lineColor.cgColor
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])


        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = lineHeight
        
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    @objc
    fileprivate func addFloatingLabel() {
        if !isAdded {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.layer.backgroundColor = UIColor.clear.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.floatingLabel)
            
            let transition = CATransition()
            transition.duration = 0.13
            transition.type = .push
            transition.subtype = .fromBottom
            floatingLabel.layer.add(transition, forKey: kCATransition)
            
            self.floatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
            self.floatingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            self.placeholder = ""
            isAdded = true
        }
        self.setNeedsDisplay()
    }
    
    @objc
    fileprivate func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 1.3) {
                for subview in self.subviews where subview is UILabel {
                    subview.removeFromSuperview()
                }
               
               self.setNeedsDisplay()
            }
            self.placeholder = self._placeholder
            
        }
        self.layer.borderColor = UIColor.black.cgColor
        isAdded = false
    }

    override func draw(_ rect: CGRect) {
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        border.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
        self.rx.controlEvent([.editingChanged]).asObservable().subscribe({ _ in
            guard let text = self.text else {return}
            self.border.borderColor = self.borderColorControl(text: text)
        }).disposed(by: disposeBag)
    }
    
    func borderColorControl(text: String) -> CGColor? {
        (text.count > 0) ? (Colors.primaryStartColor?.cgColor) : (UIColor.black.cgColor)
    }
}

