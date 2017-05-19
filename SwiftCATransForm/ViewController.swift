//
//  ViewController.swift
//  SwiftCATransForm
//
//  Created by lvshasha on 2017/5/19.
//  Copyright © 2017年 com.SmallCircle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 
//    var viewOne: UIView?
    var angle = CGPoint()
    var diceView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 测试旋转图片
//        viewOne = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
//        viewOne!.backgroundColor = UIColor.blue
//        self.view.addSubview(viewOne!)
//        // 
//        let subView = UIView.init(frame: viewOne!.bounds)
//        subView.backgroundColor = UIColor.blue
//        viewOne?.addSubview(subView)
//        viewOne?.backgroundColor = UIColor.clear
        
        
        //
        angle = CGPoint.init(x: 0, y: 0)
        
        // 添加手势
        addDice()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        diceView!.addGestureRecognizer(panGesture)
    }
    
    //
//    func viewTransForm(sender:UIPanGestureRecognizer) {
//        
//        // 
//        let point = sender.translation(in: viewOne)
//        let angleX = self.angle.x + (point.x/30)
//        let angleY = self.angle.y + (point.y/30)
//        
//        var transForm = CATransform3DIdentity
//        let angle = CGFloat(45)
//        transForm.m34 = -1/500
//        transForm = CATransform3DRotate(transForm, angleX, 0, 1, 0)
//        transForm = CATransform3DRotate(transForm, angleY, 1, 0, 0)
//        viewOne!.layer.sublayerTransform = transForm
//        
//        if sender.state == .ended {
//            self.angle.x = angleY;
//            self.angle.y = angleY;
//        }
//    }
    
    func addDice() {
        let viewFrame = UIScreen.main.bounds
        
        // pi == M_PI 
        /*
         transform ： 是结合 anchorPoint（锚点）的位置来对图层和图层上的子图层进行变化。
         
         sublayerTransform：是结合anchorPoint（锚点）的位置来对图层的子图层进行变化，不包括本身。
        */
        // 
        var diceTransForm = CATransform3DIdentity
        
        diceView = UIView.init(frame: CGRect(x: 0, y: viewFrame.maxY / 2 - 50, width: viewFrame.width, height: 100))
        // 1
        let dice1 = UIImageView.init(image: UIImage(named:"dice1.jpg"));
        dice1.frame = CGRect(x: viewFrame.maxX/2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DTranslate(diceTransForm, 0, 0, 50)
        dice1.layer.transform = diceTransForm
        
        // 6
        let dice6 = UIImageView.init(image: UIImage(named:"dice6.jpg"));
        dice6.frame = CGRect(x: viewFrame.maxX/2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -50)
        dice6.layer.transform = diceTransForm
        
        // 2
        let dice2 = UIImageView.init(image: UIImage(named: "dice2.jpg"))
        dice2.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 0, 1, 0)
        diceTransForm = CATransform3DTranslate(diceTransForm, 0, 0, 50)
        dice2.layer.transform = diceTransForm
        
        // 5
        let dice5 = UIImageView.init(image: UIImage(named: "dice5.jpg"))
        dice5.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 0, 1, 0)
        diceTransForm = CATransform3DTranslate(diceTransForm, 0, 0, 50)
        dice5.layer.transform = diceTransForm
        
        // 3 
        let dice3 = UIImageView.init(image: UIImage(named: "dice3.jpg"))
        dice3.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi/2), 1, 0, 0)
        diceTransForm = CATransform3DTranslate(diceTransForm, 0, 0, 50)
        dice3.layer.transform = diceTransForm
        
        // 4
        let dice4 = UIImageView.init(image: UIImage(named: "dice4.jpg"))
        dice4.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransForm = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi/2), 1, 0, 0)
        diceTransForm = CATransform3DTranslate(diceTransForm, 0, 0, 50)
        dice4.layer.transform = diceTransForm
        
        diceView?.addSubview(dice1)
        diceView?.addSubview(dice2)
        diceView?.addSubview(dice3)
        diceView?.addSubview(dice4)
        diceView?.addSubview(dice5)
        diceView?.addSubview(dice6)
        
        
        view.addSubview(diceView!)
        
    }
    
    func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: diceView)
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        diceView!.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



































