//
//  URLConstants.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import Foundation

struct APIConstants {
    
    //Base URL
    /// This will remain same for every api request.
    /// It is used in makeURL()) method of APIManager class.
    /// which gives us final url to hit API.
    static let baseURL = "https://official-joke-api.appspot.com/jokes/programming/"
    
    // End Points
    /// These enf points can be one or more than one in a  project.
    /// You can add all  the end points of any API like the below one's.
    static let tenJokes = "ten"
    
}
