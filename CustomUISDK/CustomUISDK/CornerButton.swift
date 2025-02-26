//
//  CornerButton.swift
//  CustomUISDK
//
//  Created by ThienDD9 on 19/07/2024.
//

import UIKit

@IBDesignable
public class CornerButton: UIButton {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setButton()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButton()
    }
    
    @IBInspectable
    var radius: CGFloat = 20 {
        didSet {
            updateRadius()
        }
    }
    
    @IBInspectable
    public override var backgroundColor: UIColor? {
        didSet {
            updateBackgroundColor()
        }
    }
    
    func updateRadius() {
        self.layer.cornerRadius = radius
    }
    
    func updateBackgroundColor() {
        self.layer.backgroundColor = backgroundColor?.cgColor
    }
    
    func setButton() {
        
        self.setTitleColor(.white, for: .normal)
        //self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.layer.cornerRadius = radius
        self.layer.backgroundColor = backgroundColor?.cgColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.yellow.cgColor
        self.layer.shadowOffset = .init(width: 0, height: 4)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        
    }
}
