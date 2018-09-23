//
//  ViewController.swift
//  Cubo Flotando
//
//  Created by Adrian on 21/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FunctionViewDataSource {
  
    
    @IBOutlet weak var posSpeedFunctionView: FunctionView!
    @IBOutlet weak var timePosFunctionView: FunctionView!
    @IBOutlet weak var timeSpeedFunctionView: FunctionView!
    @IBOutlet weak var timeAccFunctionView: FunctionView!
    
    @IBOutlet weak var lengthSlider: UIView!
    
    // THe value of the slider got the lenth value.
    
    // @IBOutlet weak var funcView: FunctionView!
    
    
    // FIsrts it is created an atribute of the class
    var cubeModel : CubeModel!
    
    @IBAction func updateLength(_ sender: UISlider) {
        
        cubeModel.L = Double(sender.value)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeModel = CubeModel() // It is created an object of class cubeModel
        posSpeedFunctionView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        //        funcView.scale = 2
        //        funcView.lw = 8
        //        funcView.color = .blue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /**
     Start time for the graphic
     */
    func startTimeOfFunctionView(_ functionView: FunctionView) -> Double {
        return 0
    }
    
    /**
    End time for the graphic
     */
    func endTimeOfFunctionView(_ functionView: FunctionView) -> Double {
        return 10
    }
    
    /**
     Depending on the functionView it changes the point at time t found.
     
     - parameter:
     
      * FunctionView
      * Time
     
     - Return:
     
     *CGPoint
     
     */
    func pointOfFunctionView(_ functionView: FunctionView, atTime time: Double) -> Point {
        switch functionView {
            
        case posSpeedFunctionView:
            let x = cubeModel.posAtTime(time)
            let y = cubeModel.speedAtTime(time)
            return Point(x:x, y:y)
            
        case timePosFunctionView:
            let x = time
            let y = cubeModel.posAtTime(time)
            return Point(x:x, y:y)
            
        case timeSpeedFunctionView:
            let x = time
            let y = cubeModel.speedAtTime(time)
            return Point(x:x, y:y)
        
        case timeAccFunctionView:
            let x = time
            let y = cubeModel.accAtTime(time)
            return Point(x:x, y:y)
            
        default:
            return Point(x:0, y:0)
        }
    }
    
    

    
}

