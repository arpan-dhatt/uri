//
//  JobDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct Job: Codable, Hashable {
    var consumer_id: String
    var provider_id: String
    var problem_category: String
    var available_times: [[String]]
    var location: String
    var images: [String]
    var video: String
    var video_transcription: String
    var additional_info: String
    var status: String
    var rating: Float
}

class JobDataSource: ObservableObject {
    static var shared = JobDataSource()
    
    private struct get_job_RequestBody: Codable {
        var job_id: String
    }
    
    @Published var jobs = [String: Job]()
    
    func loadJob(id: String) {
        if !jobs.keys.contains(id) {
            let url = URL(string: "\(NetworkConfiguration.url_root)get_job")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = try! JSONEncoder().encode(get_job_RequestBody(job_id: id))
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(request)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                let job = try! JSONDecoder().decode(Job.self, from: data)
                DispatchQueue.main.async {
                    self.jobs[id] = job
                }
            }
            task.resume()
        }
    }
}
