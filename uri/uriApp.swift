//
//  uriApp.swift
//  uri
//
//  Created by Arpan Dhatt on 2/20/21.
//

import SwiftUI

@main
struct uriApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
