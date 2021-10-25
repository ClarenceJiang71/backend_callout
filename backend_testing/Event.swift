//
//  Event.swift
//  backend_testing
//
//  Created by Clarence Jiang on 10/18/21.
//

import Foundation
import UIKit

struct Event:Codable, Hashable{
    let event_culture: Int
    var event_type: Int
    var event_name: String
    var event_location: String
    var event_description: String
    var creator: String // foreign key problem need to be solved
    var created_date: String // Date type, not sure if this is going to affect
    var modified_date: String
    var event_cover_image: String // It's kind of hard to deal with image directly， will further develop a function to take image file_name to access real image
    var event_more_image: String
    var event_price: String
    var participant: String //This is related to another table, similar to foreign key
    
    
    
}
