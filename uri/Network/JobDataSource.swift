//
//  JobDataSource.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct Job: Codable, Hashable {
    var job_id: String
    var consumer_id: String
    var provider_id: String
    var problem_category: String
    var available_times: [String]
    var location: String
    var images: [String]
    var video: String
    var video_transcription: String
    var additional_info: String
    var status: String
    var rating: Float
}

class JobDataSource: ObservableObject {
    static var consumer_completed_jobs = JobDataSource(.consumer, endpoint: "consumer_completed_jobs")
    static var consumer_current_jobs = JobDataSource(.consumer, endpoint: "consumer_completed_jobs")
    static var provider_completed_jobs = JobDataSource(.provider, endpoint: "provider_completed_jobs")
    static var provider_available_jobs = JobDataSource(.provider, endpoint: "provider_available_jobs")
    static var provider_accepted_jobs = JobDataSource(.provider, endpoint: "provider_accepted_jobs")
    
    enum RequestType {
        case consumer
        case provider
    }
    
    var requestType: RequestType
    var endpoint: String
    
    private struct get_job_ConsumerRequestBody: Codable {
        var consumer_id: String
    }
    
    private struct get_job_ProviderRequestBody: Codable {
        var provider_id: String
    }
    
    private struct get_job_ResponseBody: Codable {
        var job_list: [Job]
    }
    @Published var jobs = [Job]()
    
    init(_ requestType: RequestType, endpoint: String) {
        self.requestType = requestType
        self.endpoint = endpoint
    }
    
    func loadJobs(id: String) {
        let url = URL(string: "\(NetworkConfiguration.url_root)\(endpoint)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if self.requestType == .consumer {
            request.httpBody = try! JSONEncoder().encode(get_job_ConsumerRequestBody(consumer_id: id))
        }
        else {
            request.httpBody = try! JSONEncoder().encode(get_job_ProviderRequestBody(provider_id: id))
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(request)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let jobResponse = try! JSONDecoder().decode(get_job_ResponseBody.self, from: data)
            DispatchQueue.main.async {
                self.jobs.append(contentsOf: jobResponse.job_list)
            }
        }
        task.resume()
    }
}
