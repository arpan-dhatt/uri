//
//  CustomerHistoryView.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct CustomerHistoryView : View {
    private enum HistoryType: String, CaseIterable, Identifiable{
        case current = "Current"
        case completed = "Completed"
        
        var id: String{ self.rawValue }
    }
    
    @State private var historyTypes: HistoryType = .current
    
    var body: some View {
        VStack {
            Picker(selection: $historyTypes, label: Text(""), content: {
                ForEach(HistoryType.allCases) {
                    Text($0.rawValue).font(.title2)
                }
            }).pickerStyle(SegmentedPickerStyle())
            Divider()
        }
    }
}

struct CustomerHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerHistoryView().environmentObject(ViewModel())
    }
}
