//
//  AnimatedMaskLabel.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 03/11/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import UIKit
import QuartzCore
import CoreText

class AnimatedMaskLabel: UIView {
    
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    var text = "Varda che beo"
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        // mettici il background color
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        
        gradientLayer.frame = CGRect (
            x: -bounds.size.width,
            y: bounds.origin.y,
            width: 3 * bounds.size.width,
            height: bounds.size.height)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        //colori del gradiente
        var colors: [AnyObject] = [
            UIColor.yellowColor().CGColor,
            UIColor.greenColor().CGColor,
            UIColor.orangeColor().CGColor,
            UIColor.cyanColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor.yellowColor().CGColor
        ]
        gradientLayer.colors = colors
        
        var locations: [AnyObject] = [
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0
        ]
        
        gradientLayer.locations = locations
        layer.addSublayer(gradientLayer)
        
        // creo l'animazione data dalle locations che vedi sopra. I parametri che vedi sono le location come numeri essendo 6 quindi gli aggiungo i valori che vedi per far si che appaiano...Un pò' difficile da spiegare ma se ci giochi con i valori capisci
        let gradientAnimation = CABasicAnimation (keyPath: "locations")
        
        gradientAnimation.fromValue = [0.0, 0.0, 0.0, 0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.65, 0.8, 0.85, 0.9, 0.95, 1.0]
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = 1_000_000
        gradientAnimation.removedOnCompletion = false
        gradientAnimation.fillMode = kCAFillModeForwards
        
        gradientLayer.addAnimation(gradientAnimation, forKey: nil)
        
        
        // utilizzo il font che voglio e poi...
        let font = UIFont (name: "HelveticaNeue-Thin", size: 28.0)
        
        let style = NSMutableParagraphStyle()
        style.alignment = .Center
        
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        let attrs = NSMutableDictionary()
        attrs[NSFontAttributeName] = font
        attrs[NSParagraphStyleAttributeName] = style
        
        text.drawInRect(bounds, withAttributes: attrs)
        
        // avedo un'immagine come UIview nella storyboard ci applico poi una masklayer
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.clearColor().CGColor
        maskLayer.frame = CGRectOffset(bounds, bounds.size.width, 0)
        maskLayer.contents = image.CGImage
        
        gradientLayer.mask = maskLayer
    }
    
}
