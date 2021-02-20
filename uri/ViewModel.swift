//
//  ViewModel.swift
//  uri
//
//  Created by user175936 on 2/20/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model = InfoModel();
    
    //Transition Variables
    @Published var onboarding: Bool = true {
        didSet {
            UserDefaults.standard.set(onboarding, forKey: "onboarding")
        }
    }
    @Published var onboardingPage: String = "1"
    @Published var user: InfoModel.User = InfoModel.User.init(name: "Arpan", email: "A@Gmail.com", address: "h streeet", domicileType: "apartment", phoneNumber: "911")
    @Published var provider: InfoModel.Provider = InfoModel.Provider.init(name:
                                                                            "Vivy", email: "v@yahoo.com", address: "v street", experience: "none", phoneNumber: "119", aboutMe: "irrelevant", type: "audioVisual")
    @Published var page: String = "Login"
    
    //User Defaults
}


