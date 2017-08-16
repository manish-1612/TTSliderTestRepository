//
//  ViewController1.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 14/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var arrayForCarTypes : [IRCarSubCategories]?
    var arrayForCarButtons: [IRCarButton]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
                
                createCarButtonsHorizontallyWith(centreLine.frame.origin.y)
                
            }else if arrayForCarTypes?.count > 3 && arrayForCarTypes?.count <= 5{
                //no support
            }else{
                //cannot be drawn
            }
        }
    }
    
    
    func createCarButtonsHorizontallyWith(centreY: CGFloat){
        
        arrayForCarButtons = [IRCarButton]()
        
        let intermediateSpacing = (self.view.frame.size.width - (CGFloat(arrayForCarTypes!.count) * 72.0))/CGFloat(arrayForCarTypes!.count + 1)
        
        for i in 0...(arrayForCarTypes?.count)!-1{
            let subCategory = arrayForCarTypes![i]
            
            let xOrigin = (CGFloat(i) * 72.0) + (intermediateSpacing * CGFloat(i + 1))
            let yOrigin = centreY - (72.0/2.0)
                        
            let frameForButton = CGRectMake(xOrigin, yOrigin, 72.0, 72.0)
            let carButton = IRCarButton(frame: frameForButton, category: subCategory)
            if i % 2 == 0{
                carButton.backgroundColor = UIColor.redColor()
            }else{
                carButton.backgroundColor = UIColor.purpleColor()
            }
            
            carButton.addTarget(self, action: #selector(ViewController1.carSelected(_:)), forControlEvents: .TouchUpInside)
            carButton.layer.cornerRadius = 72.0/2.0
            carButton.layer.masksToBounds = true
            self.view.addSubview(carButton)
            
            arrayForCarButtons?.append(carButton)
            
        }
    }
    
    
    func carSelected(sender: IRCarButton){
        
        print("car selected : \(sender.category?.category, sender.category?.subCategory)")
    }

}
