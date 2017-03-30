//
//  CropViewUseLayer.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

class CropViewUseLayer: UIView {

    var lineModelArray:[LineModel] = []
    
    func drawLine() -> Void {
        
        let path = UIBezierPath()
        
        for model in lineModelArray {
            path.move(to: model.startPoint)
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
        shapeLayer.frame = self.frame
        self.layer.mask = shapeLayer
        
        let borderLLayer = CAShapeLayer()
        borderLLayer.path = path.cgPath
        borderLLayer.fillColor = UIColor.green.cgColor
        borderLLayer.strokeColor = UIColor.purple.cgColor
        borderLLayer.lineWidth = 2.0
        self.layer.addSublayer(borderLLayer)
        
      
    }
    

}
