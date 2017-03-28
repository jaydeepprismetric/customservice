//
//  mySellingList.swift
//  SellsSwipe
//
//  Created by MAC-4 on 3/28/17.
//  Copyright © 2017 Mitesh. All rights reserved.
//

import Foundation
import SwiftyJSON


public struct mySellingList {
    let postId:Int
    let userId:Int
    let categoryId:Int
    let postStatusId:Int
    let FeaturedTypeId:Int
    let title:String
    let description:String
    let price:Float
    let latitude:Float
    let longitude:Float
    let locationString:String
    let createdAt:String
    let modifiedAt:String
    let category:String
    let destanceInMiles:Float
    let charges:Float
    let image:[images]
}

extension mySellingList:JSONConvertible {
    static func fromJSON(json: JSON) ->mySellingList {
        
        var arrayImages = [images]()
        if let imagearray = json["images"].array {
            arrayImages = imagearray.map({return images.fromJSON(json: $0)})
        }
        
        return mySellingList(postId: json["post_id"].intValue,
                             userId: json["user_id"].intValue,
                             categoryId: json["category_id"].intValue,
                             postStatusId: json["post_status_id"].intValue,
                             FeaturedTypeId: json["featured_type_id"].intValue,
                             title: json["title"].stringValue,
                             description: json["description"].stringValue,
                             price: json["price"].floatValue,
                             latitude: json["latitude"].floatValue,
                             longitude: json["longitude"].floatValue,
                             locationString: json["location_string"].stringValue,
                             createdAt: json["created_at"].stringValue,
                             modifiedAt: json["modified_at"].stringValue,
                             category: json["category"].stringValue,
                             destanceInMiles: json["distance_in_miles"].floatValue,
                             charges: json["charges"].floatValue,
                             image:arrayImages)
    }
}

public struct images {
    let imgUrl:String
    let imgUrlThumb:String
}

extension images:JSONConvertible {
    static func fromJSON(json: JSON) -> images {
        return images(imgUrl: json["img_url"].stringValue, imgUrlThumb: json["img_url_thumb"].stringValue)
    }
}



