//
//  Postman.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct Review: Codable {
    var job_id: String
    var rating: Float
}

class Postman {
    
    private struct new_consumer_ResponseData: Codable {
        var consumer_id: String
    }
    
    static func new_consumer(_ consumer: Consumer) {
        let url = URL(string: "\(NetworkConfiguration.url_root)new_consumer")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(consumer)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(new_consumer_ResponseData.self, from: data)
            DispatchQueue.main.async {
                // todo
                print(response_data)
            }
        }
        task.resume()
    }
    
    private struct new_provider_ResponseData: Codable {
        var provider_id: String
    }
    
    static func new_provider(_ provider: Provider) {
        let url = URL(string: "\(NetworkConfiguration.url_root)new_producer")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(provider)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(new_provider_ResponseData.self, from: data)
            DispatchQueue.main.async {
                // todo
                print(response_data)
            }
        }
        task.resume()
    }
    
    private struct new_job_ResponseData: Codable {
        var job_id: String
    }
    
    static func new_job(_ job: Job) {
        let url = URL(string: "\(NetworkConfiguration.url_root)new_job")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(job)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(new_job_ResponseData.self, from: data)
            DispatchQueue.main.async {
                // todo
                print(response_data)
            }
        }
        task.resume()
    }
    
    private struct add_review_ResponseData: Codable {
        var job_id: String
        var rating: Float
    }
    
    static func add_review(_ review: Review) {
        let url = URL(string: "\(NetworkConfiguration.url_root)add_review")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(review)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(add_review_ResponseData.self, from: data)
            DispatchQueue.main.async {
                // todo
                print(response_data)
            }
        }
        task.resume()
    }
    
    static func convertImageToJPEGBase64(image: UIImage) -> String {
        image.jpegData(compressionQuality: 0.25)!.base64EncodedString()
    }
}
