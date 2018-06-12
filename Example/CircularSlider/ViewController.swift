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
        
        cs = UICircularSliderView(radius: 100, startAngle: .pi, endAngle: .pi * 2, clockwise: true, strokeWidth: 5, backgroundStrokeColor: .gray, foregroundStrokeColor: .blue)
        cs.frame = CGRect(x: 100, y: 200, width: 300, height: 300)
        self.view.addSubview(cs)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        cs.animate(placeholderArcTo: 1.0, in: 1.0)
        cs.animate(progressArcTo: 0.5, in: 1.0)
    }
}

