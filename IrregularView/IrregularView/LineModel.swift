//
//  LineModel.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

enum LineType {

    case StraightLine //直线
    
    case CurveLine  //曲线
    
}

class LineModel: NSObject {
    
    var startPoint:CGPoint = CGPoint(x:0,y:0)
    
    var endPoint:CGPoint = CGPoint(x:0,y:0)
    
    var controlPoint:CGPoint = CGPoint(x:0,y:0)
    
    var lineType:LineType = .StraightLine
    
}
