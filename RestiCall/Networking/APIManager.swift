//
//  APICaller.swift
//  RestiCall
//
//  Created by Muhammad Suleman on 4/27/23.
//

import SwiftUI
//import Alamofire
//
//func makeAPIRequest(url: String, headers: HTTPHeaders?, parameters: Parameters?, image: UIImage?, completion: @escaping (Result<Any, Error>) -> Void) {
//    AF.upload(multipartFormData: { multipartFormData in
//        if let image = image, let imageData = image.jpegData(compressionQuality: 0.5) {
//            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
//        }
//        if let parameters = parameters {
//            for (key, value) in parameters {
//                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key as String)
//            }
//        }
//    }, to: url, headers: headers)
//    .validate()
//    .responseJSON { response in
//        switch response.result {
//        case .success(let value):
//            completion(.success(value))
//        case .failure(let error):
//            completion(.failure(error))
//        }
//    }
//}
