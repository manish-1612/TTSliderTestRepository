//
//  IRCar.swift
//  InnoRideUserApp
//
//  Created by Manish Kumar on 13/09/16.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Gloss

public struct IRCar : Decodable, Encodable {
    
    public var _id : String!
    public var category : String!
    public var subCategories: [IRCarSubCategories]?
    
    public init() {
        
    }
    
    // Deserialization
    public init?(json: JSON) {
        _id = "_id" <~~ json
        category = "category" <~~ json
        subCategories = "subCategories" <~~ json

    }
    
    // Serialization
    public func toJSON() -> JSON? {
        return jsonify([
            "_id" ~~> self._id,
            "category" ~~> self.category,
            "subCategories" ~~> self.subCategories

            ])
    }
    
    // Decode
    public init(dictionary: Dictionary<String, AnyObject>){
        
        _id = dictionary["_id"] as? String
        category = dictionary["category"] as? String
      
        let arrFromEncoding = dictionary["subCategories"] as? [Dictionary<String,AnyObject>]
      
        var arr : [IRCarSubCategories] = [IRCarSubCategories]()
      
        if arrFromEncoding != nil {
            for driver in arrFromEncoding! {
                  arr.append(IRCarSubCategories(dictionary: driver))
            }
            subCategories = arr
        } else {
            subCategories = nil
        }


    }
    
    // Encode
    public mutating func encode() -> Dictionary<String, AnyObject> {
        
        var dictionary : Dictionary = Dictionary<String, AnyObject>()
        
        dictionary["_id"] = _id
        dictionary["category"] = category
      
        var array : [Dictionary<String,AnyObject>] = [Dictionary<String,AnyObject>]()
      
        if subCategories?.count > 0{
            for subCategory in subCategories! {
                  array.append( subCategory.encode() )
            }
            dictionary["subCategories"] = array
        }

        return dictionary
    }
    
    

}