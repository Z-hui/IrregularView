//
//  ViewController.swift
//  IrregularView
//
//  Created by HSEDU on 17/3/30.
//  Copyright © 2017年 HSEDU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cropView = CropViewUseLayer()
        cropView.frame = CGRect(x:40,y:80,width:200,height:200)
        cropView.backgroundColor = UIColor.yellow
        self.view.addSubview(cropView)
       
        let offsetX:CGFloat = 0.0
        var modelArray:[LineModel] = []
        let model1 = LineModel()
        model1.startPoint = CGPoint(x:40+offsetX,y:80)
        model1.endPoint = CGPoint(x:140+offsetX,y:80)
        
        let model2 = LineModel()
        model2.startPoint = CGPoint(x:140+offsetX,y:80)
        model2.endPoint = CGPoint(x:140+offsetX,y:180)
        model2.controlPoint = CGPoint(x:90+offsetX,y:130)
        model2.lineType = .CurveLine
        
        let model3 = LineModel()
        model3.startPoint = CGPoint(x:140+offsetX,y:180)
        model3.endPoint = CGPoint(x:40+offsetX,y:180)
        
        let model4 = LineModel()
        model4.startPoint = CGPoint(x:40+offsetX,y:180)
        model4.endPoint = CGPoint(x:90+offsetX,y:130)
        
        let model5 = LineModel()
        model5.startPoint = CGPoint(x:90+offsetX,y:130)
        model5.endPoint = CGPoint(x:40+offsetX,y:80)
        
        modelArray.append(model1)
        modelArray.append(model2)
        modelArray.append(model3)
        modelArray.append(model4)
        modelArray.append(model5)
        
        cropView.layer.borderColor = UIColor .blue.cgColor
        cropView.layer.borderWidth = 2
        
        cropView.lineModelArray = modelArray
        
        cropView.drawLine()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

