//
//  ConsumerDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct Consumer: Codable, Hashable {
    var domicile_type: String
    var address: String
    var name: String
    var email: String
    var phone: String
}

class ConsumerDataSource: ObservableObject {
    static var shared = ConsumerDataSource()
    
    private struct get_consumer_RequestBody: Codable {
        var consumer_id: String
    }
    
    @Published var consumers = [String: Consumer]()
    
    func loadConsumer(id: String) {
        if !consumers.keys.contains(id) {
            let url = URL(string: "http://47.37.119.216:8000/get_consumer")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.httpBody = try! JSONEncoder().encode(get_consumer_RequestBody(consumer_id: id))
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(request)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let consumer = try! JSONDecoder().decode(Consumer.self, from: data)
                DispatchQueue.main.async {
                    self.consumers[id] = consumer
                }
            }
            task.resume()
        }
    }
}

