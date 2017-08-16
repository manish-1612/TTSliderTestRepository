//
//  CarButton.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 16/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

class IRCarButton: UIButton {
    
    let category: IRCarSubCategories?

    init(frame: CGRect, category: IRCarSubCategories) {
        self.category = category
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
