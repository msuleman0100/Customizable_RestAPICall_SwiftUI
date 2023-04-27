//
//  JokesVM.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import SwiftUI
import Alamofire

class JokesVM: ObservableObject {
    
    //Object of JokesResponse
    @Published var jokes: [JokeResponse] = []
    // For saving error messages.
    @Published var errorMessage: String = ""
    // for managing state after hitting api
    @Published var isLoading: Bool = false
    
    //Fetching jokes here
    func fetchJokes() {
        isLoading = true
        APIManager.shared.request(url: APIConstants.tenJokes) { [weak self] (result: Result<[JokeResponse], AFError>) in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let newJokes):
                // Saving jokes for future use after they're successfully fetched
                self.jokes = newJokes
            case .failure(let error):
                /// Saving the error messaage in self.errorMessage
                /// Which can be print in debug-area or on scree to user as a popup
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
