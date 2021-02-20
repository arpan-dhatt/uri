//
//  ProviderHistoryDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

class ProviderHistoryDataSource {
    static var shared = ProviderHistoryDataSource()
    
    @Published var jobIds = [String]()
    
    private struct provider_job_history_RequestBody: Codable {
        var provider_id: String
    }
    
    private struct provider_job_history_ResponseBody: Codable {
        var job_id_list: [String]
    }
    
    func loadJobIds(provider_id: String) {
        let url = URL(string: "http://47.37.119.216:8000/provider_job_history")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = try! JSONEncoder().encode(provider_job_history_RequestBody(provider_id: provider_id))
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(provider_job_history_ResponseBody.self, from: data)
            DispatchQueue.main.async {
                self.jobIds.append(contentsOf: response_data.job_id_list)
            }
        }
        task.resume()
    }
}
