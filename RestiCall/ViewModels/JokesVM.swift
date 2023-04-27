//
//  JokesVM.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import Foundation
import SwiftUI

import Alamofire


class JokesViewModel: ObservableObject {
    
    @Published var jokes: JokeResponse?
    
    func fetchJokes() {
        makeAPIRequest(url: "https://sv443.net/jokeapi/v2/joke/Any",
                       headers: nil,
                       parameters: nil,
                       image: nil) { result in
            switch result {
            case .success(let data):
                if let jokes = try? JSONDecoder().decode(JokeResponse.self, from: data as! Data) {
                    self.jokes = jokes
                    print(self.jokes)
                }
            case .failure(let error):
                print("API error: \(error.localizedDescription)")
            }
        }
    }
    
    func makeAPIRequest(url: String, headers: HTTPHeaders?, parameters: Parameters?, image: UIImage?, completion: @escaping (Result<Any, Error>) -> Void) {
        AF.upload(multipartFormData: { multipartFormData in
            if let image = image, let imageData = image.jpegData(compressionQuality: 0.5) {
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
            }
            if let parameters = parameters {
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key as String)
                }
            }
        }, to: url, headers: headers)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - JokeResponse
struct JokeResponse: Codable {
    let error: Bool
    let category, type, setup, delivery: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}

