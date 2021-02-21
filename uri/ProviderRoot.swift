//
//  ProviderRoot.swift
//  uri
//
//  Created by user175571 on 2/21/21.
//

import SwiftUI

struct ProviderRoot: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var selection = 0
    
    var body: some View {
        ZStack{
            TabView(selection: $selection) {
                Login()
                    .tabItem {
                        Label("Orders", systemImage: "newspaper")
                    }.tag(0)
               ProviderMapView()
                    .tabItem {
                        Label("Map", systemImage: "map.fill")
                    }.tag(1)
                ProviderProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill.checkmark")
                    }.tag(2)
            }
        }
    }
}

struct ProviderRoot_Previews: PreviewProvider {
    static var previews: some View {
        ProviderRoot().environmentObject(ViewModel())
    }
}
