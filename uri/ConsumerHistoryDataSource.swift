//
//  ConsumerHistoryDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

class ConsumerHistoryDataSource: ObservableObject {
    static var shared = ConsumerHistoryDataSource()
    
    @Published var jobIds = [String]()
    
    private struct consumer_job_history_RequestBody: Codable {
        var consumer_id: String
    }
    
    private struct consumer_job_history_ResponseBody: Codable {
        var job_id_list: [String]
    }
    
    func loadJobIds(consumer_id: String) {
        let url = URL(string: "\(NetworkConfiguration.url_root)consumer_job_history")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(consumer_job_history_RequestBody(consumer_id: consumer_id))
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let response_data = try! JSONDecoder().decode(consumer_job_history_ResponseBody.self, from: data)
            DispatchQueue.main.async {
                self.jobIds.append(contentsOf: response_data.job_id_list)
            }
        }
        task.resume()
    }
}
