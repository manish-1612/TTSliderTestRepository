//
//  InnoType.swift
//  HorizontalParallaxTest
//
//  Created by Manish Kumar on 16/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit

import Gloss

public struct InnoType: Decodable {
    
    public var innoType: [IRCar]?
    
    public init() {
        
    }
    
    // Deserialization
    public init?(json: JSON) {
        innoType = "innoType" <~~ json
        
    }
    
    // Serialization
    public func toJSON() -> JSON? {
        return jsonify([
            "innoType" ~~> self.innoType
            
            ])
    }
    
    // Decode
    public init(dictionary: Dictionary<String, AnyObject>){

        
        let arrFromEncoding = dictionary["innoType"] as? [Dictionary<String,AnyObject>]
        
        var arr : [IRCar] = [IRCar]()
        
        if arrFromEncoding != nil {
            for driver in arrFromEncoding! {
                arr.append(IRCar(dictionary: driver))
            }
            innoType = arr
        } else {
            innoType = nil
        }
        
        
    }
    
    // Encode
    public mutating func encode() -> Dictionary<String, AnyObject> {
        
        var dictionary : Dictionary = Dictionary<String, AnyObject>()
        
        var array : [Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>]()
        
        if innoType?.count > 0{
            for car in innoType! {
                var carNew = car as? IRCar
                array.append(carNew!.encode())
            }
            dictionary["innoType"] = array
        }
        
        return dictionary
    }
    
    
    
}