//
//  JokesResponse.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import Foundation

struct Joke: Codable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
