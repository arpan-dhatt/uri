//
//  ContentView.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.page == "Login"{
            Text(viewModel.page)
                .padding()
        }
        if viewModel.page == "Consumer"{
            Text(viewModel.page)
                .padding()
        }
        if viewModel.page == "Provider"{
            Text(viewModel.page)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
