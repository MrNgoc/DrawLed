//
//  ViewController.swift
//  DrawLed
//
//  Created by Admin on 5/29/16.
//  Copyright © 2016 MrNgoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    var n: Int!
    var lastOnLed = -1
    
    @IBAction func drawball(sender: AnyObject) {
        drawBall()
        view.endEditing(true)
    }
    var _margin: CGFloat = 50
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true )
        
    }
    func runningLed(){
        
        if let n = n {
            if (lastOnLed != -1 ){
                
                turnOffLed()
            }
            if lastOnLed != n - 1 {
                lastOnLed = lastOnLed + 1
                
                
            }
                
            else{
                lastOnLed = 0
                
            }
            turnOnLed()
        }
      
        
    }

    func turnOnLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
        
            ball.image = UIImage(named: "green2x.png")
        }
    
    }
    func turnOffLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
            
            ball.image = UIImage(named: "grey@2x.png")
    
    }
    
    }
    func drawBall() {
        
        n = Int(tf.text!)
        
        for index in 0..<n {
            for index1 in 0..<n {
            let image = UIImage(named:"green@2x.png")
            let ball = UIImageView(image:image)
            
        
        ball.center = CGPointMake(_margin + CGFloat(index)*spaceBetweenBall(),_margin + CGFloat(index1)*spaceBetweenBall1())
            
            self.view.addSubview(ball)
                ball.tag =  index + 100
                
            
            }
        }

    }
    func spaceBetweenBall() -> CGFloat{
    let space = (self.view.bounds.size.width - 2 * _margin) / CGFloat(n - 1)
    
        return space
    

    }
    func spaceBetweenBall1() -> CGFloat{
        let space1 = (self.view.bounds.size.height - 2*_margin) / CGFloat(n - 1)
        
        return space1
    }

}

