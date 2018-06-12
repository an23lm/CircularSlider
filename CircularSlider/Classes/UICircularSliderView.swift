//
//  UICircularSliderView.swift
//  CircularSlider
//
//  Created by Ansèlm Joseph on 07/06/18.
//

import UIKit

@IBDesignable
public class UICircularSliderView: UIView {
 
    @IBInspectable public var radius: CGFloat = 0
    @IBInspectable public var startAngle: CGFloat = 0
    @IBInspectable public var endAngle: CGFloat = 0
    @IBInspectable public var strokeWidth: CGFloat = 0
    @IBInspectable public var clockwise: Bool = true
    @IBInspectable public var lineCap: String = kCALineCapSquare
    @IBInspectable public var bgStrokeColor: UIColor = UIColor.darkGray
    @IBInspectable public var fgStrokeColor: UIColor = UIColor.cyan
    
    private(set) public var placeholderArcCurrentStrokeEnd: CGFloat = 0
    private(set) public var progressArcCurrentStrokeEnd: CGFloat = 0
    
    private(set) public var placeholderArcBezierPath: UIBezierPath? = nil
    private(set) public var placeholderArcShapeLayer: CAShapeLayer? = nil
    
    private(set) public var progressArcBezierPath: UIBezierPath? = nil
    private(set) public var progressArcShapeLayer: CAShapeLayer? = nil
    
    private func getDegree(fromRadians number: CGFloat) -> CGFloat {
        return number * 180 / .pi
    }
    
//    private func getArcCenter(for rect: CGRect, radius: CGFloat, minAngle: CGFloat, maxAngle: CGFloat, clockwise: Bool) {
//        let minAnglePositionY = radius * sin(getDegree(fromRadians: minAngle))
//        let maxAnglePositionY = radius * sin(getDegree(fromRadians: maxAngle))
//        print(minAnglePositionY + rect.height)
//        print(maxAnglePositionY + rect.height)
//
//    }
    
    public override func draw(_ rect: CGRect) {
        drawBgArc()
        drawFgArc()
    }
    
    public convenience init(radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool, strokeWidth: CGFloat, backgroundStrokeColor: UIColor, foregroundStrokeColor: UIColor) {
        self.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100)))
        
        self.backgroundColor = .white
        
        self.radius = radius
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.strokeWidth = strokeWidth
        self.bgStrokeColor = backgroundStrokeColor
        self.fgStrokeColor = foregroundStrokeColor
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func drawBgArc() {
        placeholderArcShapeLayer?.removeFromSuperlayer()
        
        placeholderArcBezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        placeholderArcBezierPath?.lineWidth = strokeWidth
        
        placeholderArcShapeLayer = CAShapeLayer()
        placeholderArcShapeLayer?.path = placeholderArcBezierPath?.cgPath
        placeholderArcShapeLayer?.lineWidth = strokeWidth
        placeholderArcShapeLayer?.strokeStart = 0
        placeholderArcShapeLayer?.strokeEnd = 0
        placeholderArcShapeLayer?.strokeColor = bgStrokeColor.cgColor
        placeholderArcShapeLayer?.fillColor = UIColor.clear.cgColor
        placeholderArcShapeLayer?.lineCap = lineCap
        
        layer.addSublayer(placeholderArcShapeLayer!)
    }
    
    private func drawFgArc() {
        progressArcShapeLayer?.removeFromSuperlayer()
        
        progressArcBezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        progressArcBezierPath?.lineWidth = strokeWidth
        
        progressArcShapeLayer = CAShapeLayer()
        progressArcShapeLayer?.path = progressArcBezierPath?.cgPath
        progressArcShapeLayer?.lineWidth = strokeWidth
        progressArcShapeLayer?.strokeStart = 0
        progressArcShapeLayer?.strokeEnd = 0
        progressArcShapeLayer?.strokeColor = fgStrokeColor.cgColor
        progressArcShapeLayer?.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(progressArcShapeLayer!)
    }
    
    public func animate(placeholderArcTo position: CGFloat, in duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = placeholderArcCurrentStrokeEnd
        animation.toValue = position
        
        placeholderArcCurrentStrokeEnd = position
        placeholderArcShapeLayer?.strokeEnd = position
        placeholderArcShapeLayer?.add(animation, forKey: "back.stroke.end")
    }
    
    public func animate(progressArcTo position: CGFloat, in duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = progressArcCurrentStrokeEnd
        animation.toValue = position
        
        progressArcCurrentStrokeEnd = position
        progressArcShapeLayer?.strokeEnd = position
        progressArcShapeLayer?.add(animation, forKey: "front.stroke.end")
    }
    
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        for touch in touches {
//            let point = touch.location(in: self)
//            if placeholderArcShapeLayer!.contains(point) {
//                let centeredPoint = CGPoint(x: (point.x - frame.width/2), y: (point.y - frame.height/2))
//                print(centeredPoint)
//                var rads = atan(centeredPoint.y/centeredPoint.x)
//                if centeredPoint.x < 0 {
//                    rads += CGFloat.pi
//                } else if centeredPoint.x > 0 && centeredPoint.y < 0 {
//                    rads += CGFloat.pi * 2
//                }
//                let perc = (rads - startAngle) / abs(startAngle - endAngle)
//                progressArcShapeLayer?.strokeEnd = perc
//            }
//        }
//    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        for touch in touches {
            let point = touch.location(in: self)
            if placeholderArcBezierPath!.contains(point) {
                let centeredPoint = CGPoint(x: (point.x - frame.width/2), y: (point.y - frame.height/2))
                print(centeredPoint)
                var rads = atan(centeredPoint.y/centeredPoint.x)
                if centeredPoint.x < 0 {
                    rads += CGFloat.pi
                } else if centeredPoint.x > 0 && centeredPoint.y < 0 {
                    rads += CGFloat.pi * 2
                }
                let perc = (rads - startAngle) / abs(startAngle - endAngle)
                progressArcShapeLayer?.strokeEnd = perc
            }
        }
    }
    
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        for touch in touches {
//            print(touch.location(in: self))
//        }
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//        for touch in touches {
//            print(touch.location(in: self))
//        }
//    }
}
