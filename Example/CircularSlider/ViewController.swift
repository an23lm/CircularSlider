//
//  ViewController.swift
//  CircularSlider
//
//  Created by anselmjosephs@gmail.com on 06/07/2018.
//  Copyright (c) 2018 anselmjosephs@gmail.com. All rights reserved.
//

import UIKit
import CircularSlider

class ViewController: UIViewController {

    var cs: UICircularSliderView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cs = UICircularSliderView(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        cs.backgroundColor = .red
        self.view.addSubview(cs)
        
        cs.setBackCircle(inRect: cs.bounds, radius: 100, minAngle: 0, maxAngle: CGFloat.pi * 2, clockwise: true, lineWidth: 10, color: UIColor.white, lineCapStyle: CGLineCap.round)
        cs.setFrontCircle(inRect: cs.bounds, radius: 100, minAngle: 0, maxAngle: CGFloat.pi * 2, clockwise: true, lineWidth: 10, color: UIColor.blue, lineCapStyle: CGLineCap.round)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        cs.animateBackCircle(toPosition: 1, duration: 1.0)
        cs.animateFrontCircle(toPosition: 1, duration: 1.0)
    }
}

