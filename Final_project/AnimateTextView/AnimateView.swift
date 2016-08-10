//
//  AnimateView.swift
//  AnimateTextView
//
//  Created by archerLj on 16/8/10.
//  Copyright © 2016年 com.bocodo.csr. All rights reserved.
//

import UIKit

class AnimateView: UIView {
    
    @IBInspectable var text: String!
    
    let textAttributes : NSDictionary = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        return [
            NSFontAttributeName:  UIFont(name: "Verdana-Italic", size: 28.0)!,
            NSParagraphStyleAttributeName: style
        ]
    }()
    
    let grandientLayer: CAGradientLayer = {
        let grandientLayer = CAGradientLayer()
        grandientLayer.colors = [
            UIColor.darkGray().cgColor,
            UIColor.white().cgColor,
            UIColor.darkGray().cgColor
        ]
        grandientLayer.locations = [0.0, 0.5, 1.0]
        grandientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        grandientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return grandientLayer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        grandientLayer.frame = bounds
        
        // 添加遮罩层
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let nsstringText = text as NSString
        nsstringText.draw(in: bounds, withAttributes: textAttributes as? [String : AnyObject])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let maskLayer = CALayer()
        maskLayer.frame = bounds
        maskLayer.contents = image?.cgImage
        grandientLayer.mask = maskLayer
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        layer.addSublayer(grandientLayer)
        
        let animate = CABasicAnimation(keyPath: "locations")
        animate.fromValue = [0.0, 0.0, 0.2]
        animate.toValue = [0.8,1.0, 1.0]
        animate.duration = 2.5
        animate.repeatCount = Float.infinity
        grandientLayer.add(animate, forKey: nil)
    }
}
