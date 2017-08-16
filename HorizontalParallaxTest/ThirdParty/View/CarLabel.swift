//
//  CarLabel.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 16/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

class IRCarLabel: UILabel {
    
    var isSelected: Bool = false{
        didSet{
            self.changeLabelTextColor(isSelected)
        }
    }

    
    func changeLabelTextColor(isSelected: Bool){
        if isSelected{
            self.textColor = UIColor.blueColor()
        }else{
            self.textColor = UIColor.grayColor()
        }
    }

}
