//
//  AnimateView.swift
//  AnimateTextView
//
//  Created by archerLj on 16/8/10.
//  Copyright © 2016年 com.bocodo.csr. All rights reserved.
//

import UIKit

class AnimateView: UIView {
    
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
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        layer.addSublayer(grandientLayer)
    }
}
