//
//  HinderModel.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

enum HinderType {
    
    case HinderRectangle //矩形
    
    case HinderCircular  //圆形
    
}
class HinderModel: NSObject {
    
    var startPoint:CGPoint = CGPoint(x:0,y:0)
    
    var endPoint:CGPoint = CGPoint(x:0,y:0)
    
    var controlPoint:CGPoint = CGPoint(x:0,y:0)
    
    var controlPoint2:CGPoint = CGPoint(x:0,y:0) //给矩形用的 矩形的第二个转折点
    
    var hinderType:HinderType = .HinderRectangle
    
    //生成和它对立的障碍
    func creatOtherModel() -> HinderModel {
        
        let anotherModel = HinderModel()
        anotherModel.startPoint = self.startPoint
        anotherModel.endPoint = self.endPoint
        anotherModel.controlPoint = CGPoint(x:controlPoint.x,y:controlPoint.y)
        anotherModel.controlPoint2 = CGPoint(x:controlPoint2.x,y:controlPoint2.y)
        anotherModel.hinderType = self.hinderType
        
        return anotherModel
    }
    
}

