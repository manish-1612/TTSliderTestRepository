//
//  IRCarSubCategories.swift
//  Qreep
//
//  Created by Manish Kumar on 10/08/17.
//  Copyright © 2017 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Gloss

public struct IRCarSubCategories : Decodable, Encodable {
      
      

      public var _id : String!
      public var category : String!
      public var subCategory : String!
      public var pricePerKm : NSNumber!
      public var waitingCharegePerMin : NSNumber!
      public var baseFare : NSNumber!
      public var baseKm : NSNumber!
      public var serviceTax : NSNumber!
      public var geoFenceId : String!

      public init() {
            
      }
      
      // Deserialization
      public init?(json: JSON) {
            _id = "_id" <~~ json
            category = "category" <~~ json
            subCategory = "subCategory" <~~ json
            pricePerKm = "pricePerKm" <~~ json
            waitingCharegePerMin = "waitingCharegePerMin" <~~ json
            baseFare = "baseFare" <~~ json
            baseKm = "baseKm" <~~ json
            serviceTax = "serviceTax" <~~ json
            geoFenceId = "geoFenceId" <~~ json

      }
      
      // Serialization
      public func toJSON() -> JSON? {
            return jsonify([
                  "_id" ~~> self._id,
                  "category" ~~> self.category,
                  "subCategory" ~~> self.subCategory,
                  "pricePerKm" ~~> self.pricePerKm,
                  "waitingCharegePerMin" ~~> self.waitingCharegePerMin,
                  "baseFare" ~~> self.baseFare,
                  "baseKm" ~~> self.baseKm,
                  "serviceTax" ~~> self.serviceTax,
                  "geoFenceId" ~~> self.geoFenceId

                  ])
      }
      
      // Decode
      public init(dictionary: Dictionary<String, AnyObject>){
            
            _id = dictionary["_id"] as? String
            category = dictionary["category"] as? String
            subCategory = dictionary["subCategory"] as? String
            pricePerKm = dictionary["pricePerKm"] as? NSNumber
            waitingCharegePerMin = dictionary["waitingCharegePerMin"] as? NSNumber
            baseFare = dictionary["baseFare"] as? NSNumber
            baseKm = dictionary["baseKm"] as? NSNumber
            serviceTax = dictionary["serviceTax"] as? NSNumber
            geoFenceId = dictionary["geoFenceId"] as? String

            
      }
      
      // Encode
      public func encode() -> Dictionary<String, AnyObject> {
            
            var dictionary : Dictionary = Dictionary<String, AnyObject>()
            
            dictionary["_id"] = _id
            dictionary["category"] = category
            dictionary["subCategory"] = subCategory
            dictionary["pricePerKm"] = pricePerKm
            dictionary["waitingCharegePerMin"] = waitingCharegePerMin
            dictionary["baseFare"] = baseFare
            dictionary["baseKm"] = baseKm
            dictionary["serviceTax"] = serviceTax
            dictionary["geoFenceId"] = geoFenceId
            

            return dictionary
      }
      
      
      
}