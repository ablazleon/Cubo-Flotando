//
//  FunctionView.swift
//  Cubo Flotando
//
//  Created by Adrian on 21/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//



import UIKit

// Point
struct Point {
    var x = 0.0
    var y = 0.0
}
// It is created a protocol FunctionVIewDataSOurce so to obtain the data from the view form the view controller. The function get a type func, and depending on it get an star time.

protocol FunctionViewDataSource : class{
    
    func startTimeOfFunctionView(_  functionView: FunctionView) -> Double
    func endTimeOfFunctionView(_ functionView: FunctionView) -> Double
    func pointOfFunctionView(_ functionView: FunctionView, atTime time: Double) -> Point
    
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
    
    // It is created an object dataSource
    
    weak var dataSource: FunctionViewDataSource!
    
    override func draw(_ rect: CGRect) {
        
        drawAxis()
        drawTrajectory()
        
        //   // Old Drawing code: sustitute by private functions.
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
     
     It is needed:
     
     - Start point
     - Start time
     - A resolution
     - A function to display
     - An ending point
     */
    private func drawTrajectory() {
        
        let path = UIBezierPath()
        
        //Initial position
//        var x0 = 0.0
//        var y0 = 0.0
//        var t0 = 0.0
        
        path.move(to: CGPoint(x: x0, y: y0))
        
        // It is draw the path
        for t in stride (from: t0, to: 800.0, by: 2.0){
            
            // Find next point
            // var xnext = nextX(t)
            // var ynext = nextY(t)
            
            // pointOfFunctionView, chooses the appropiate function depending of the UIVIew and then the view Controller display it.
            let nextPoint = dataSource.pointOfFunctionView(self, atTime: t)
            
            // All the formulas go to the Cube Model
            // path.addLine(to: CGPoint(x: xnext, y: ynext))
            
            path.addLine(to: CGPoint(x:nextPoint.x, y: nextPoint.y))
            //path.addLine(to: CGPoint(x:xnext, y:ynext))
        }
        
        UIColor.red.setStroke()
        path.lineWidth = 1.0
        path.stroke()
        
    }
    
    
}
