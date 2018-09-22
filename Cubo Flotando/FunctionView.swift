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
@IBDesignable
class FunctionView: UIView {

    @IBInspectable
    var color : UIColor = .red
    
    @IBInspectable
    var lw : Double = 5
    
    @IBInspectable
    var scale : Double = 4
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Inner atribute of the method
        
   // Drawing code
        
        // Given an initial value it is drawn the cosine
        let path = UIBezierPath()
        
        let i0 = 0.0
        let x0 = 0.0
        let y0 = 100.0
        
        path.move(to: CGPoint(x:10, y:10)) // To draw the line it should start
        
        // How to do a for that makes form i = 0 to a certain value
        for i in stride(from: i0, to:800.0, by:1.0){
            let x = i + x0
            let y = scale * (cos(i) + y0)
            path.addLine(to: CGPoint(x:x, y:y))
        
        }
        
        path.lineWidth = CGFloat(lw)
        // UIColor.red.setStroke()
        color.setStroke()
        // UIColor.color.setStroke()
        path.stroke()
        
        
        
    }
    

}
