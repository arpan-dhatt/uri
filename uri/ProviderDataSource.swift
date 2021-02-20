//
//  ProviderDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct Provider: Codable, Hashable {
    var image: String
    var name: String
    var type: String
    var jobs_completed: Int
    var about_me: String
    var email: String
    var phone: String
    var rating: Float
    var hourly_rate: Float
}

class ProviderDataSource: ObservableObject {
    static var shared = ProviderDataSource()
    
    private struct get_provider_RequestBody: Codable {
        var provider_id: String
    }
    
    @Published var providers = [String: Provider]()
    
    func loadProvider(id: String) {
        if !providers.keys.contains(id) {
            let url = URL(string: "http://47.37.119.216:8000/get_provider")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.httpBody = try! JSONEncoder().encode(get_provider_RequestBody(provider_id: id))
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(request)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let provider = try! JSONDecoder().decode(Provider.self, from: data)
                DispatchQueue.main.async {
                    self.providers[id] = provider
                }
            }
            task.resume()
        }
    }
}
