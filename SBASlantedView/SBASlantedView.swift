//
//  Label.swift
//  TitledView
//
//  Created by Shoaib Akhtar on 17/05/2019.
//  Copyright © 2019 MyStuffAps. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class SBASlantedView: UIView {
    
    @IBInspectable public var slantHeight: CGFloat = -15 { didSet { updatePath() } }
    @IBInspectable public var rotation: CGFloat = -45 { didSet { updateLabel() } }
    @IBInspectable public var labelBottomOffset: CGFloat = 25 { didSet { updateLabel()} }
    @IBInspectable public var text: String = "For Sale" { didSet { updateLabel()} }
    @IBInspectable public var textColor: UIColor = .white { didSet { updateLabel()} }
    @IBInspectable public var fontSize: CGFloat = 13 { didSet { updateLabel()} }
    @IBInspectable public var isSemiBold: Bool = true { didSet { updateLabel()} }

    
    
    private var label : SlantedCustomLabel?
    
    private let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 0
        shapeLayer.fillColor = UIColor.white.cgColor
        return shapeLayer
    }()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addLabel()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addLabel()
    }
    
    private func addLabel(){
        if self.label == nil{
            self.label = SlantedCustomLabel.init(frame: self.bounds)
            self.label?.textAlignment = .center
            self.addSubview(self.label!)
            
            // Calculating default values
            self.labelBottomOffset = bounds.height/4
        }
        updateLabel()
        self.layoutIfNeeded()
    }
    
    private func updatePath() {
        let bezierPath = UIBezierPath()
        
        
        bezierPath.move(to: CGPoint(x: bounds.minX , y: bounds.height/2 - slantHeight))
        
        bezierPath.addLine(to: CGPoint(x: bounds.minX  , y: bounds.height))
        
        bezierPath.addLine(to: CGPoint(x: bounds.minX+bounds.width , y: bounds.minY ))
        
        bezierPath.addLine(to: CGPoint(x: (bounds.width/2) - slantHeight, y: bounds.minY ))
        
        bezierPath.addLine(to: CGPoint(x: bounds.minX , y: bounds.height/2 - slantHeight))
        
        
        bezierPath.close()
        shapeLayer.path = bezierPath.cgPath
        layer.mask = shapeLayer
        
    }
    
    private func updateLabel(){
        //        self.label?.font = font
        self.label?.label_Rotation = rotation
        self.label?.bottomInset =  labelBottomOffset
        self.label?.text = text
        self.label?.textColor = textColor
        label?.font = isSemiBold ?  UIFont.systemFont(ofSize: fontSize, weight: .semibold) : UIFont.systemFont(ofSize: fontSize)
    }
    
    
}

@IBDesignable
class SlantedCustomLabel: UILabel {
    
    var label_Rotation: CGFloat = 0 {
        didSet {
            rotateLabel(labelRotation: label_Rotation)
            self.layoutIfNeeded()
        }
    }
    
    func rotateLabel(labelRotation: CGFloat)  {
        self.transform = CGAffineTransform(rotationAngle: CGFloat((CGFloat.pi / 180) * label_Rotation ))
        self.layoutIfNeeded()
    }
    
    
    var topInset: CGFloat = 0.0 {
        didSet {
            self.layoutIfNeeded()
        }
    }
    var bottomInset: CGFloat = 0.0 {
        didSet {
            self.layoutIfNeeded()
        }
    }
    var leftInset: CGFloat = 0.0 {
        didSet {
            self.layoutIfNeeded()
        }
    }
    var rightInset: CGFloat = 0.0 {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
