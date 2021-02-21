//
//  ConsumerRoot.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct ConsumerRoot: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var selection = 0
    
    var body: some View {
        ZStack{
            TabView(selection: $selection) {
                Login()
                    .tabItem {
                        Label("Orders", systemImage: "newspaper")
                    }.tag(0)
                CustomerOrderView()
                    .tabItem {
                        Label("New", systemImage: "plus")
                    }.tag(1)
                CustomerProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill.checkmark")
                    }.tag(2)
            }
        }
    }
}

struct ConsumerRoot_Previews: PreviewProvider {
    static var previews: some View {
        ConsumerRoot().environmentObject(ViewModel())
    }
}
