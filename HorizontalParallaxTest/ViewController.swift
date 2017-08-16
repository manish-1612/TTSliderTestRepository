//
//  ViewController.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 14/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit
import Gloss


class ViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    var slider : TTScrollSlidingPagesController?
    var arrayForAllCarButtons = [IRCarButton]()
    var innoType: [IRCar]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //pageMenuSetup()
        getTestData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getTestData(){
       
        if let path = NSBundle.mainBundle().pathForResource("CarType", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    if let _ = jsonResult["innoType"] {
                        
                        guard let innoTypeData = InnoType(json: jsonResult as! JSON) else{
                            return
                        }
                        
                        self.innoType = innoTypeData.innoType
                        self.TTSliderSetup()

                    }
                } catch {}
            } catch {}
        }
    }

    
    func pageMenuSetup(){
        
        let main = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        var controllerArray : [UIViewController] = []
        
        let controller1 : ViewController1 = main.instantiateViewControllerWithIdentifier("ViewController1") as! ViewController1
        controller1.title = "ViewController1"
        controllerArray.append(controller1)
        
        let controller2 : ViewController2 = main.instantiateViewControllerWithIdentifier("ViewController2") as! ViewController2
        controller1.title = "ViewController2"
        controllerArray.append(controller2)
        
        let controller3 : ViewController3 = main.instantiateViewControllerWithIdentifier("ViewController3") as! ViewController3
        controller1.title = "ViewController3"
        controllerArray.append(controller3)

        
        let controller4 : ViewController4 = main.instantiateViewControllerWithIdentifier("ViewController4") as! ViewController4
        controller1.title = "ViewController4"
        controllerArray.append(controller4)

        
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            
            
            .MenuItemWidth(UIScreen.mainScreen().bounds.size.width/2.0),
            .CenterMenuItems(true),
            .MenuItemSeparatorWidth(4.3),
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 241.0/255.0, green: 242.0/255.0, blue: 248.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor.clearColor()),
            .SelectionIndicatorColor(UIColor.redColor()),
            .MenuMargin(20.0),
            .MenuHeight(42.0),
            .SelectedMenuItemLabelColor(UIColor.orangeColor()),
            .UnselectedMenuItemLabelColor(UIColor.grayColor()),
            .MenuItemSeparatorRoundEdges(false),
            .SelectionIndicatorHeight(3.0),
            .MenuItemMargin(0.0),
            .MenuMargin(0.0),
            .ScrollAnimationDurationOnMenuItemTap(200),
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 72.0, self.view.frame.width, self.view.frame.height - 72.0), pageMenuOptions: parameters)
        
        // Optional delegate
        //pageMenu!.delegate = self
        //        pageMenu!.applyShadowOnMenuScroll()
        
        
        self.view.addSubview(pageMenu!.view)
    }


    
    func TTSliderSetup(){
        
        self.slider = TTScrollSlidingPagesController()

        self.slider?.dataSource = self
        self.slider?.delegate = self
        

        self.slider?.titleScrollerBottomEdgeColour = UIColor.clearColor()
        self.slider?.titleScrollerBottomEdgeHeight = 0
        self.slider!.titleScrollerHeight = 30
        self.slider?.titleScrollerTextFont = UIFont.boldSystemFontOfSize(14.0)
        self.slider?.titleScrollerInActiveTextFont = UIFont.boldSystemFontOfSize(14.0)
        self.slider?.titleScrollerTextColour = UIColor.blackColor()
        self.slider?.titleScrollerInActiveTextColour = UIColor.grayColor()
        self.slider!.titleScrollerItemWidth = Int32(UIScreen.mainScreen().bounds.size.width/2.0)
        self.slider!.titleScrollerBackgroundColour = UIColor.whiteColor()
        self.slider!.disableTitleScrollerShadow = true
        self.slider!.disableUIPageControl = true
        self.slider!.initialPageNumber = 0
        self.slider!.pagingEnabled = true
        self.slider!.zoomOutAnimationDisabled = true
        self.slider!.disableTitleShadow = true
        self.slider!.titleScrollerTriangleHidden = true

        self.slider?.view.frame = CGRectMake(0.0, self.view.frame.size.height - 177.0 - 40.0, self.view.frame.size.width, 177.0)
        self.view.addSubview((self.slider?.view)!)
        

        //self.addChildViewController(self.slider!)


    }
}


extension ViewController: TTSlidingPagesDataSource{
    
    func numberOfPagesForSlidingPagesViewController(source: TTScrollSlidingPagesController!) -> Int32 {
        return Int32((innoType?.count)!)
    }
    
    func pageForSlidingPagesViewController(source: TTScrollSlidingPagesController!, atIndex index: Int32) -> TTSlidingPage! {
        
        let main = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let car = innoType![Int(index)]
        
        let viewController : ViewController1 = main.instantiateViewControllerWithIdentifier("ViewController1") as! ViewController1
        viewController.arrayForCarTypes = car.subCategories
        viewController.carSelectionDelegate = self
        viewController.parentVC = self
        viewController.view.backgroundColor = UIColor.clearColor()
        
        return TTSlidingPage(contentViewController: viewController)
        
    }
    
    func titleForSlidingPagesViewController(source: TTScrollSlidingPagesController!, atIndex index: Int32) -> TTSlidingPageTitle! {
        
        let car = innoType![Int(index)]
        let title = TTSlidingPageTitle(headerText: car.category.uppercaseString)
        return title!
        
    }
}

extension ViewController: TTSlidingPageDelegate{
    func didScrollToViewAtIndex(index: UInt) {

    }
    
    func didTapOnScrollTopView(index: UInt) {

    }
}


extension ViewController: CarSelectionVCDelegate{
    
    func carSelectedWithSubCategory(subcategory: IRCarSubCategories) {
        
        for button in arrayForAllCarButtons{
            if subcategory.category == button.category?.category && subcategory.subCategory == button.category?.subCategory{
                button.selected = true
                button.categoryPriceLabel?.isSelected = true
            }else{
                button.selected = false
                button.categoryPriceLabel?.isSelected = false
            }
        }
        
        
        print("selected category : \(subcategory.category, subcategory.subCategory)")
    }
}
