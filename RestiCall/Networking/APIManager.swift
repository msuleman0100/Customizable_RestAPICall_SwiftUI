//
//  APIManager.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import SwiftUI
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    private let session: Session
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        session = Session(configuration: configuration)
    }
    
    // For setting-up final URL hit API, used in request() method below
    private func makeURL(_ url: String?) -> URL {
        if let endPoint = url {
            return URL(string: APIConstants.baseURL.appending(endPoint))!
        } else { return URL(string: APIConstants.baseURL)! }
    }
    
    //This is the actuall method for calling API
    func request<T: Decodable>(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String: Any]? = nil,
                               image: UIImage? = nil,
                               completion: @escaping (Result<T, AFError>) -> Void) {
        
        let apiURL = makeURL(url)
        print("\nUURL -> \(apiURL.description)")
        let request: DataRequest
        // Setting request for api call with-image provided in params
        if let image = image, let imageData = image.jpegData(compressionQuality: 1) {
            request = self.session.upload(multipartFormData: { multipartFormData in
                for (key, value) in parameters ?? [:] {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
            }, to: apiURL)
        } else {
            // setting request for api call without-image provided in params
            request = self.session.request(apiURL, method: method, parameters: parameters)
        }
        
        request.validate()
            .responseDecodable(of: T.self) { response in
                // sending response on completion
                completion(response.result)
            }
            .resume()
    }
    
    
}
