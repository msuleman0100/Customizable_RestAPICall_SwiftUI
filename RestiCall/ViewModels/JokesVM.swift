//
//  JokesVM.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import Foundation
import SwiftUI

class JokesViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    
    func fetchJokes() {
        makeAPIRequest(url: "https://official-joke-api.appspot.com/jokes/ten",
                       headers: nil,
                       parameters: nil,
                       image: nil) { [weak self] result in
            switch result {
            case .success(let data):
                if let jokes = try? JSONDecoder().decode([Joke].self, from: data as! Data) {
                    self?.jokes = jokes
                }
            case .failure(let error):
                print("API error: \(error.localizedDescription)")
            }
        }
    }
}
