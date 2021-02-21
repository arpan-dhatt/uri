//
//  ConsumerRoot.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct ConsumerRoot: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            TabView {
                Login()
                    .tabItem {
                        Label("Orders", systemImage: "newspaper")
                    }
                ProviderOnboarding()
                    .tabItem {
                        Label("New", systemImage: "plus")
                    }
                CustomerProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill.checkmark")
                    }
            }
        }
    }
}

struct ConsumerRoot_Previews: PreviewProvider {
    static var previews: some View {
        ConsumerRoot().environmentObject(ViewModel())
    }
}
