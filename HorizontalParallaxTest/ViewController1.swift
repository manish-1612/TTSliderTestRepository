//
//  ViewController1.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 14/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

protocol CarSelectionVCDelegate:class {
    func carSelectedWithSubCategory(subcategory: IRCarSubCategories)
}


class ViewController1: UIViewController {
    
    var arrayForCarTypes : [IRCarSubCategories]?
    var arrayForCarButtons: [IRCarButton]?
    var carSelectionDelegate: CarSelectionVCDelegate?
    var parentVC: ViewController?
    var shouldSelectionBeDone: Bool?

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
                let centreY = self.view.frame.size.height / 2.0
                let yOriginForButtons = centreY - 25.0
                createCarButtonsHorizontallyWith(yOriginForButtons)
                
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
            
            //button for car selection
            let frameForButton = CGRectMake(xOrigin, yOrigin, 72.0, 72.0)
            let carButton = IRCarButton(frame: frameForButton, category: subCategory)
            carButton.backgroundColor = UIColor.redColor()
            carButton.addTarget(self, action: #selector(ViewController1.carSelected(_:)), forControlEvents: .TouchUpInside)
            if shouldSelectionBeDone == true{
                if i == 0{
                    carButton.selected = true
                    carSelected(carButton)
                }else{
                    carButton.selected = false
                }
            }
            carButton.layer.cornerRadius = 72.0/2.0
            carButton.layer.masksToBounds = true
            self.view.addSubview(carButton)
            
            //label for subcategory name
            let xOriginForLabel = carButton.frame.origin.x
            let yOriginForLabel = carButton.frame.origin.y + carButton.frame.size.height + 10.0
            
            let labelForSubcategoryName = UILabel(frame: CGRectMake(xOriginForLabel, yOriginForLabel, 200.0, 23.0))
            labelForSubcategoryName.text = subCategory.subCategory.uppercaseString
            labelForSubcategoryName.textColor = UIColor.lightGrayColor()
            labelForSubcategoryName.font = UIFont.systemFontOfSize(12.0)
            self.view.addSubview(labelForSubcategoryName)
            labelForSubcategoryName.numberOfLines = 0
            labelForSubcategoryName.sizeToFit()
            labelForSubcategoryName.center = CGPointMake(carButton.center.x, labelForSubcategoryName.center.y)
            
            
            //label for subcategory price
            let xOriginForPriceLabel = carButton.frame.origin.x
            let yOriginForPriceLabel = labelForSubcategoryName.frame.origin.y + labelForSubcategoryName.frame.size.height + 10.0
            
            let labelForSubcategoryPrice = IRCarLabel(frame: CGRectMake(xOriginForPriceLabel, yOriginForPriceLabel, 200.0, 23.0))
            labelForSubcategoryPrice.text = "$\(subCategory.baseFare)"
            labelForSubcategoryPrice.textColor = UIColor.grayColor()
            labelForSubcategoryPrice.font = UIFont.systemFontOfSize(14.0)
            self.view.addSubview(labelForSubcategoryPrice)
            labelForSubcategoryPrice.numberOfLines = 0
            labelForSubcategoryPrice.sizeToFit()
            labelForSubcategoryPrice.center = CGPointMake(carButton.center.x, labelForSubcategoryPrice.center.y)
            if shouldSelectionBeDone == true{
                if i == 0{
                    labelForSubcategoryPrice.isSelected = true
                }else{
                    labelForSubcategoryPrice.isSelected = false
                }
            }
            carButton.categoryPriceLabel = labelForSubcategoryPrice
            arrayForCarButtons?.append(carButton)
            parentVC?.arrayForAllCarButtons.append(carButton)
            
        }
    }
    
    
    func carSelected(sender: IRCarButton){
        if carSelectionDelegate != nil{
            carSelectionDelegate?.carSelectedWithSubCategory(sender.category!)
        }
    
    }

}
