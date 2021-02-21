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
            Login()
        }
        if viewModel.page == "LoginCustomer"{
            CustomerOnboarding()
        }
        if viewModel.page == "LoginProvider"{
            ProviderOnboarding()
        }
        if viewModel.page == "Customer"{
            ConsumerRoot()
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
