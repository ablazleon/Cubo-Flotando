//
//  FunctionView.swift
//  Cubo Flotando
//
//  Created by Adrian on 21/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//



import UIKit

// It is created a protocol FunctionVIewDataSOurce so to obtain the data from the view form the view controller.

protocol FunctionViewDataSource : class{
    
    func setBegin( i0: Double)
}

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
    
    override func draw(_ rect: CGRect) {
        
        drawAxis()
        
        // It is draw the trajectory and the axis
        
        // Inner atribute of the method
        
//   // Drawing code
//        // Como narizes añadir cosntarints  y data source
//        // Given an initial value it is drawn the cosine
//        let path = UIBezierPath()
//
//        let i0 = 0.0
//        let x0 = 0.0
//        let y0 = 100.0
//
//        path.move(to: CGPoint(x:10, y:10)) // To draw the line it should start
//
//        // How to do a for that makes form i = 0 to a certain value
//        for i in stride(from: i0, to:800.0, by:1.0){
//            let x = i + x0
//            let y = scale * (cos(i) + y0)
//            path.addLine(to: CGPoint(x:x, y:y))
//
//        }
//
//        path.lineWidth = CGFloat(lw)
//        // UIColor.red.setStroke()
//        color.setStroke()
//        // UIColor.color.setStroke()
//        path.stroke()
        
    }
    
    /**
    Draws the axis in the UIView
     
     */
    private func drawAxis(){
        
        let xmax = bounds.size.width
        let ymax = bounds.size.height
        
        let xaxis = UIBezierPath()
        let yaxis = UIBezierPath()
        
        xaxis.move(to: CGPoint(x:0, y:(ymax/2)))
        xaxis.addLine(to: CGPoint(x:xmax, y:(ymax/2)))
        
        yaxis.move(to: CGPoint(x:(xmax/2), y:0))
        yaxis.addLine(to: CGPoint(x:(xmax/2), y:ymax))
        
        UIColor.black.setStroke()
        xaxis.lineWidth = 1.0
        xaxis.stroke()
        
        UIColor.black.setStroke()
        yaxis.lineWidth = 1.0
        yaxis.stroke()
        
    }
    
    /**
     Draws the axis in the UIView
     
     */
    private func drawTrajectory() {
        
    }

}
