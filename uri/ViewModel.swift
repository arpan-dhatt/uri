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
    @Published var user: InfoModel.User
    @Published var provider: InfoModel.Provider = InfoModel.Provider.init(name:
                                                                            "Vivy", profilePic: UIImage(named: "biden")!, email: "v@yahoo.com", address: "v street", experience: "none", phoneNumber: "119", aboutMe: "irrelevant", type: "audioVisual")
    @Published var page: String = "Login"
    @Published var customerOrderPage: String = "1"
    @Published var customerOrderType: String = "none"
    
    //User Defaults
        init(){
            self.user = InfoModel.User.init(name: "Arpan", email: "A@Gmail.com", address: "h streeet", domicileType: "apartment", phoneNumber: "911")
            self.provider = InfoModel.Provider.init(name:"Vivy", profilePic: UIImage(named: "biden")!, email: "v@yahoo.com", address: "v street", experience: "none", phoneNumber: "119", aboutMe: "irrelevant", type: "audioVisual")
            
            self.user.name = UserDefaults.standard.string(forKey: "name") ?? "Arpan"
            self.user.email = UserDefaults.standard.string(forKey: "email") ?? "Yolo"
            self.user.address = UserDefaults.standard.string(forKey: "address") ?? "Yala"
            self.user.phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? "911"
            self.user.domicileType = UserDefaults.standard.string(forKey: "domicileType") ?? "house"
            
            self.provider.name = UserDefaults.standard.string(forKey: "nameP") ?? " "
            self.provider.email = UserDefaults.standard.string(forKey: "emailP") ?? " "
            self.provider.address = UserDefaults.standard.string(forKey: "addressP") ?? " "
            self.provider.experience = UserDefaults.standard.string(forKey: "experienceP") ?? " "
            self.provider.phoneNumber = UserDefaults.standard.string(forKey: "phoneNumberP") ?? " "
            self.provider.aboutMe = UserDefaults.standard.string(forKey: "aboutMeP") ?? " "
            self.provider.type = UserDefaults.standard.string(forKey: "typeP") ?? " "
            //self.provider.profilePic = UserDefaults.standard.object(forKey: "profilePicP") as! UIImage

        }
}


