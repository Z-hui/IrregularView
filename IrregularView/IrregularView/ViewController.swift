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
        resetAction()
    }
    
    func pieceUI() -> Void {
        let btn = UIButton()
        btn.frame = CGRect(x:(UIScreen.main.bounds.size.width-50)/2,y:0,width:50,height:50)
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.setTitle("拼啊拼", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.addTarget(self, action: #selector(pieceAction), for: .touchUpInside)
    }
    
    func resetUI() -> Void {
        let btn = UIButton()
        btn.frame = CGRect(x:(UIScreen.main.bounds.size.width-50)/2,y:(UIScreen.main.bounds.size.height-50),width:50,height:50)
        self.view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.setTitle("重置", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
    }
    
    func pieceAction() -> Void {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "piece"), object: nil)
    }
    
    func resetAction() -> Void {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        pieceUI()
        resetUI()
        creatView1()
    }

    func creatView1() -> Void {
        
        let cropView = CropViewUseLayer()
        cropView.frame = CGRect(x:40,y:80,width:200,height:200)
        cropView.backgroundColor = UIColor.yellow
        self.view.addSubview(cropView)
        cropView.viewClick = { crop in
            UIView.animate(withDuration: 2, animations: {
                cropView.center = self.view.center
            }, completion: { (a:Bool) in
                
            })
        }
        
        let way = ProduceWay()
        way.theRectangleApex(one: CGPoint(x:0,y:0), two: CGPoint(x:200,y:0), three: CGPoint(x:200,y:200), four: CGPoint(x:0,y:200))
        let hider = HinderModel()
        hider.startPoint = CGPoint(x:100,y:50)
        hider.endPoint = CGPoint(x:100,y:150)
        hider.controlPoint = CGPoint(x:150,y:80)
        hider.controlPoint2 = CGPoint(x:150,y:80)
        hider.hinderType = .HinderRectangle
        way.addHider(hinder: hider)
        
        cropView.layer.borderColor = UIColor .blue.cgColor
        cropView.layer.borderWidth = 2
        
        cropView.lineModelArray = way.cropGraphOnePointArray
        cropView.drawLine()
        cropView.transform = cropView.transform.rotated(by: CGFloat(M_PI/2))
        creatView2(arr: way.cropGraphTwoPointArray)
    }
    
    func creatView2(arr:Any) -> Void {
        let cropView = CropViewUseLayer()
        cropView.frame = CGRect(x:UIScreen.main.bounds.size.width-200-40,y:80,width:200,height:200)
        cropView.backgroundColor = UIColor.yellow
        self.view.addSubview(cropView)
        cropView.viewClick = { crop in
            UIView.animate(withDuration: 2, animations: {
                cropView.center = self.view.center
            }, completion: { (a:Bool) in
                
            })
        }
        
        cropView.layer.borderColor = UIColor .blue.cgColor
        cropView.layer.borderWidth = 2
        
        cropView.lineModelArray = arr as! [LineModel]
        cropView.drawLine()
    cropView.transform = cropView.transform.rotated(by: CGFloat(M_PI/2))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

