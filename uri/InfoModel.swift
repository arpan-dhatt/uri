//
//  InfoModel.swift
//  uri
//
//  Created by user175936 on 2/20/21.
//

import Foundation


struct InfoModel {
    
    struct User {
        var name: String {
            didSet {
                UserDefaults.standard.set(name, forKey: "name")
            }
        }
        var email: String {
            didSet {
                UserDefaults.standard.set(email, forKey: "sources")
            }
        }
        var address: String {
            didSet {
                UserDefaults.standard.set(address, forKey: "address")
            }
        }
        var domicileType: domicile {
            didSet {
                UserDefaults.standard.set(domicileType, forKey: "domicileType")
            }
        }
        var phoneNumber: String {
            didSet {
                UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
            }
        }
    }
    
    struct Provider {
        var name: String {
            didSet {
                UserDefaults.standard.set(name, forKey: "nameP")
            }
        }
        var email: String {
            didSet {
                UserDefaults.standard.set(email, forKey: "sourcesP")
            }
        }
        var address: String {
            didSet {
                UserDefaults.standard.set(address, forKey: "addressP")
            }
        }
        var experience: String {
            didSet {
                UserDefaults.standard.set(experience, forKey: "experienceP")
            }
        }
        var phoneNumber: String {
            didSet {
                UserDefaults.standard.set(phoneNumber, forKey: "phoneNumberP")
            }
        }
        var aboutMe: String {
            didSet {
                UserDefaults.standard.set(aboutMe, forKey: "aboutMeP")
            }
        }
        var type: providerType {
            didSet {
                UserDefaults.standard.set(type, forKey: "typeP")
            }
        }
    }
    
}

enum domicile {
    case house, apartment, condo
}
enum providerType {
    case plumber, electrician, hvac, carpenter, audioVisual 
}