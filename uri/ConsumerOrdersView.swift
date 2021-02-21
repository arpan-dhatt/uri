//
//  ConsumerOrdersView.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

//import SwiftUI
//
//struct ConsumerOrdersView: View {
//    @ObservedObject var consumerHistoryDataSource = ConsumerHistoryDataSource.shared
//    
//    @ObservedObject var jobDataSource = JobDataSource.shared
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text("Current").font(.title)
//                VStack {
//                    ForEach(consumerHistoryDataSource.jobIds, id: \.self) { jobID in
//                        Text(jobID)
//                    }
//                }.onAppear {
//                    consumerHistoryDataSource.loadJobIds(consumer_id: "hello")
//                }
//            }
//        }
//    }
//}
//
//struct ConsumerOrdersView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConsumerOrdersView()
//    }
//}
