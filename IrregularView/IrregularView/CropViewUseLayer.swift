//
//  CropViewUseLayer.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

typealias ViewClick=(_ cropView:Any)->Void

class CropViewUseLayer: UIView {
    
    var lineModelArray:[LineModel] = []
    
    var marginalPath = UIBezierPath()
    
    let button = UIButton()
    
    var viewClick:ViewClick?
    
    func drawLine() -> Void {
        
        let path = UIBezierPath()
        
        marginalPath = path
        
        for index in 0...lineModelArray.count-1 {
            let model = lineModelArray[index]
            
            if index == 0 {
                path.move(to: model.startPoint)
            }
            if model.lineType == LineType.StraightLine {
                path.addLine(to: model.endPoint)
            }
            else
            {
                path.addQuadCurve(to: model.endPoint, controlPoint: model.controlPoint)
            }
            
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.frame = self.bounds
        self.layer.mask = shapeLayer
        
        let borderLLayer = CAShapeLayer()
        borderLLayer.path = path.cgPath
        borderLLayer.fillColor = UIColor.green.cgColor
        borderLLayer.strokeColor = UIColor.purple.cgColor
        borderLLayer.lineWidth = 2.0
        self.layer.addSublayer(borderLLayer)
    
        
        self.addSubview(button)
        button.frame = self.bounds
        button.setBackgroundImage(creatImageWithColor(color: UIColor.red), for: .highlighted)
        button.isUserInteractionEnabled  = false
        self.isUserInteractionEnabled = true
    }
    

    func creatImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x:0,y:0,width:1,height:1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = ((touches as NSSet).anyObject()! )as!UITouch
        let point = touch.location(in: self)
        if marginalPath.contains(point)
        {
            self.viewClick?(self)
            print("包含")
            button.isHighlighted = true
        }
        else{
         print("no")
        }
        
    }
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if marginalPath.contains(point)
        {
            return true
        }
        else
        {
            return false
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        button.isHighlighted = false
    }
}
