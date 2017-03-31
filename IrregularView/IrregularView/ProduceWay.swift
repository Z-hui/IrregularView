//
//  ProduceWay.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

class ProduceWay: NSObject {
    
    //矩形的四个顶点 The apex of rectangle
    var apexOne:CGPoint = CGPoint(x:0,y:0)
    var apexTwo:CGPoint = CGPoint(x:0,y:0)
    var apexThree:CGPoint = CGPoint(x:0,y:0)
    var apexFour:CGPoint = CGPoint(x:0,y:0)
    
    var centerTop:CGPoint = CGPoint(x:0,y:0)
    var centerBottom:CGPoint = CGPoint(x:0,y:0)
    
    var cropGraphOnePointArray:[LineModel] = []
    var cropGraphTwoPointArray:[LineModel] = []
    
    func theRectangleApex(one:CGPoint,two:CGPoint,three:CGPoint,four:CGPoint) -> Void {
        self.apexOne = one
        self.apexTwo = two
        self.apexThree = three
        self.apexFour = four
        self.centerTop = CGPoint(x:(one.x+two.x)/2.0,y:one.y)
        self.centerBottom = CGPoint(x:(three.x+four.x)/2.0,y:three.y)
        configeArray()
    }
    
    func addHider(hinder:HinderModel) -> Void {
        switch hinder.hinderType {
        case .HinderCircular:
          
        let anotherModel = hinder.creatOtherModel()
        //第一个数组处理
        cropGraphOnePointArray[1].endPoint = hinder.startPoint
        
        cropGraphOnePointArray.insert({
            let circularModel = LineModel()
            circularModel.startPoint = hinder.startPoint
            circularModel.endPoint = hinder.endPoint
            circularModel.controlPoint = hinder.controlPoint
            circularModel.lineType = .CurveLine
            return circularModel
            
            }(), at: 2)
        
        cropGraphOnePointArray.insert({
            let circularModel = LineModel()
            circularModel.startPoint = hinder.endPoint
            circularModel.endPoint = self.centerBottom
            return circularModel
            
        }(), at: 3)
        
        //第二个数组处理
        cropGraphTwoPointArray[3].endPoint = anotherModel.endPoint
        
        cropGraphTwoPointArray.append({
            let circularModel = LineModel()
            circularModel.startPoint = anotherModel.endPoint
            circularModel.endPoint = anotherModel.startPoint
            circularModel.controlPoint = anotherModel.controlPoint
            circularModel.lineType = .CurveLine
            return circularModel
            
        }())
        
        cropGraphTwoPointArray.append({
            let circularModel = LineModel()
            circularModel.startPoint = anotherModel.startPoint
            circularModel.endPoint = self.centerTop
            return circularModel
            
        }())
        
        
        
        break
            
        case .HinderRectangle:
        
            let anotherModel = hinder.creatOtherModel()
            //第一个数组处理
            cropGraphOnePointArray[1].endPoint = hinder.startPoint
            
            cropGraphOnePointArray.insert({
                let circularModel = LineModel()
                circularModel.startPoint = hinder.startPoint
                circularModel.endPoint = hinder.controlPoint
                return circularModel
                
            }(), at: 2)
            
            cropGraphOnePointArray.insert({
                let circularModel = LineModel()
                circularModel.startPoint = hinder.controlPoint
                circularModel.endPoint = hinder.controlPoint2
                return circularModel
                
            }(), at: 3)
            
            cropGraphOnePointArray.insert({
                let circularModel = LineModel()
                circularModel.startPoint = hinder.controlPoint2
                circularModel.endPoint = hinder.endPoint
                return circularModel
                
            }(), at: 4)
            
            cropGraphOnePointArray.insert({
                let circularModel = LineModel()
                circularModel.startPoint = hinder.endPoint
                circularModel.endPoint = self.centerBottom
                return circularModel
                
            }(), at: 5)
          
            //第二个数组处理
            cropGraphTwoPointArray[3].endPoint = anotherModel.endPoint
            
            cropGraphTwoPointArray.append({
                let circularModel = LineModel()
                circularModel.startPoint = anotherModel.endPoint
                circularModel.endPoint = anotherModel.controlPoint2
                return circularModel
                
                }())
            
            cropGraphTwoPointArray.append({
                let circularModel = LineModel()
                circularModel.startPoint = anotherModel.controlPoint2
                circularModel.endPoint = anotherModel.controlPoint
                return circularModel
                }())
            
            cropGraphTwoPointArray.append({
                let circularModel = LineModel()
                circularModel.startPoint = anotherModel.controlPoint
                circularModel.endPoint = anotherModel.startPoint
                return circularModel
                }())
            
            cropGraphTwoPointArray.append({
                let circularModel = LineModel()
                circularModel.startPoint = anotherModel.startPoint
                circularModel.endPoint = self.centerTop
                return circularModel
                }())
          
            
        break
            
        }
    }
    
    func configeArray() -> Void {
        let model1 = LineModel()
        model1.startPoint = self.apexOne
        model1.endPoint = self.centerTop
        
        let model2 = LineModel()
        model2.startPoint = self.centerTop
        model2.endPoint = self.centerBottom
        
        
        let model3 = LineModel()
        model3.startPoint = self.centerBottom
        model3.endPoint = self.apexFour
        
        let model4 = LineModel()
        model4.startPoint = self.apexFour
        model4.endPoint = self.apexOne
        
        cropGraphOnePointArray.append(model1)
        cropGraphOnePointArray.append(model2)
        cropGraphOnePointArray.append(model3)
        cropGraphOnePointArray.append(model4)
        
        let model5 = LineModel()
        model5.startPoint = self.centerTop
        model5.endPoint = self.apexTwo
        
        let model6 = LineModel()
        model6.startPoint = self.apexTwo
        model6.endPoint = self.apexThree
        
        
        let model7 = LineModel()
        model7.startPoint = self.apexThree
        model7.endPoint = self.centerBottom
        
        let model8 = LineModel()
        model8.startPoint = self.centerBottom
        model8.endPoint = self.centerTop
        
        cropGraphTwoPointArray.append(model5)
        cropGraphTwoPointArray.append(model6)
        cropGraphTwoPointArray.append(model7)
        cropGraphTwoPointArray.append(model8)
        
    }
}
