//
//  UICircularSliderView.swift
//  CircularSlider
//
//  Created by Ansèlm Joseph on 07/06/18.
//

import UIKit

@IBDesignable
public class UICircularSliderView: UIView {
 
    @IBInspectable
    private(set) public var backCircleRadius: CGFloat = 0
    @IBInspectable
    private(set) public var backCircleStartAngle: CGFloat = 0
    @IBInspectable
    private(set) public var backCircleEndAngle: CGFloat = 0
    private(set) public var backCircleCurrentStrokeEnd: CGFloat = 0
    
    private(set) public var backCircleBezierPath: UIBezierPath? = nil
    private(set) public var backCircleShapeLayer: CAShapeLayer? = nil
    
    @IBInspectable
    private(set) public var frontCircleRadius: CGFloat = 0
    @IBInspectable
    private(set) public var frontCircleStartAngle: CGFloat = 0
    @IBInspectable
    private(set) public var frontCircleEndAngle: CGFloat = 0
    private(set) public var frontCircleCurrentStrokeEnd: CGFloat = 0
    
    private(set) public var frontCircleBezierPath: UIBezierPath? = nil
    private(set) public var frontCircleShapeLayer: CAShapeLayer? = nil
    
//    private func getArcCenter(for rect: CGRect, minAngle: CGFloat, maxAngle: CGFloat, clockwise: Bool) {
//        
//    }
    
    public func setBackCircle(inRect frame: CGRect, radius: CGFloat, minAngle: CGFloat, maxAngle: CGFloat, clockwise: Bool, lineWidth: CGFloat, color: UIColor, lineCapStyle: CGLineCap) {
        backCircleShapeLayer?.removeFromSuperlayer()
        
        backCircleRadius = radius
        backCircleStartAngle = minAngle
        backCircleEndAngle = maxAngle
        
        backCircleBezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.midX, y: frame.midY), radius: radius, startAngle: minAngle, endAngle: maxAngle, clockwise: clockwise)
        backCircleBezierPath?.lineCapStyle = lineCapStyle
        
        backCircleShapeLayer = CAShapeLayer()
        backCircleShapeLayer?.path = backCircleBezierPath?.cgPath
        backCircleShapeLayer?.lineWidth = lineWidth
        backCircleShapeLayer?.strokeStart = 0
        backCircleShapeLayer?.strokeEnd = 0
        backCircleShapeLayer?.strokeColor = color.cgColor
        backCircleShapeLayer?.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(backCircleShapeLayer!)
    }
    
    public func animateBackCircle(toPosition: CGFloat, duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = backCircleCurrentStrokeEnd
        animation.toValue = toPosition
        
        backCircleCurrentStrokeEnd = toPosition
        backCircleShapeLayer?.strokeEnd = toPosition
        backCircleShapeLayer?.add(animation, forKey: "back.stroke.end")
    }
    
    public func setFrontCircle(inRect frame: CGRect, radius: CGFloat, minAngle: CGFloat, maxAngle: CGFloat, clockwise: Bool, lineWidth: CGFloat, color: UIColor, lineCapStyle: CGLineCap) {
        frontCircleShapeLayer?.removeFromSuperlayer()
        
        frontCircleRadius = radius
        frontCircleStartAngle = minAngle
        frontCircleEndAngle = maxAngle
        
        frontCircleBezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.midX, y: frame.midY), radius: radius, startAngle: minAngle, endAngle: maxAngle, clockwise: clockwise)
        frontCircleBezierPath?.lineCapStyle = lineCapStyle
        
        frontCircleShapeLayer = CAShapeLayer()
        frontCircleShapeLayer?.path = frontCircleBezierPath?.cgPath
        frontCircleShapeLayer?.lineWidth = lineWidth
        frontCircleShapeLayer?.strokeStart = 0
        frontCircleShapeLayer?.strokeEnd = 0
        frontCircleShapeLayer?.strokeColor = color.cgColor
        frontCircleShapeLayer?.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(frontCircleShapeLayer!)
    }
    
    public func animateFrontCircle(toPosition: CGFloat, duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = frontCircleCurrentStrokeEnd
        animation.toValue = toPosition
        
        frontCircleCurrentStrokeEnd = toPosition
        frontCircleShapeLayer?.strokeEnd = toPosition
        frontCircleShapeLayer?.add(animation, forKey: "front.stroke.end")
    }
}
