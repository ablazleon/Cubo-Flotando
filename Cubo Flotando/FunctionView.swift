//
//  FunctionView.swift
//  Cubo Flotando
//
//  Created by Adrian on 21/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//



import UIKit


// Function View draws a line
// @IBDesignable makes the interface builder render the view directly to the canvas.
@IBDesignable class FunctionView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x:100, y:100))
        path.lineWidth = 3
        UIColor.magenta.setStroke()
        
        
        
    }
    

}
