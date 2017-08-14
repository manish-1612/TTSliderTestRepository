//
//  ViewController1.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 14/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var arrayForCarTypes : [Int]?
    var arrayForCarButtons: [UIButton]?
    
    var separator: UIView?
    var lowerSeparator: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayForCarTypes = [Int]()
        arrayForCarTypes?.append(1)
        arrayForCarTypes?.append(2)
        arrayForCarTypes?.append(3)
    }
    
    
    override func viewWillLayoutSubviews() {
        
        createSeparators()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSeparators(){
        
        if arrayForCarTypes?.count > 0{
            if arrayForCarTypes?.count <= 3{
                
                let frame = CGRectMake(0.0, self.view.frame.size.height / 2.0, self.view.frame.size.width, 1.0)
                let centreLine = UIView(frame: frame)
                centreLine.backgroundColor = UIColor.blackColor()
                self.view.addSubview(centreLine)
                
                
                
            }else if arrayForCarTypes?.count > 3 && arrayForCarTypes?.count <= 5{
                
            }else{
                //cannot be drawn
            }
        }
    }
    
    
    func createCarButtonsHorizontally(){
        
        for i in 0...(arrayForCarTypes?.count)!-1{
          
            //let i =
        }
    }

}
