//
//  ProviderOnboarding.swift
//  uri
//
//  Created by user175936 on 2/20/21.
//

import SwiftUI

struct ProviderOnboarding: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Text("We Just Need To Know A Bit About You").font(.title).fontWeight(.semibold).padding().multilineTextAlignment(.center)
                VStack{
                    ScrollView{
                        VStack{
                            HStack{
                                Text("Name:").font(.title2).bold()
                                Spacer()
                                Image(systemName: "person.fill.badge.plus").font(.title)
                            }.padding([.top,.leading, .trailing])
                            Divider()
                            TextField("Name", text: $viewModel.provider.name).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        VStack{
                        HStack{
                            Text("Address:").font(.title2).bold()
                            Spacer()
                            Image(systemName: "house.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                        TextField("Address", text: $viewModel.provider.address).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("Phone Number:").font(.title2).bold()
                            Spacer()
                            Image(systemName: "phone.circle.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                        TextField("ex: +1 111-111-1111", text: $viewModel.provider.phoneNumber).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("Email").font(.title2).bold()
                            Spacer()
                            Image(systemName: "envelope.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                        TextField("ex: billy@gmail.com", text: $viewModel.provider.email).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("About Me").font(.title2).bold()
                            Spacer()
                            Image(systemName: "envelope.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                            TextField("ex: billy@gmail.com", text: $viewModel.provider.aboutMe).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("Experience").font(.title2).bold()
                            Spacer()
                            Image(systemName: "envelope.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                            TextField("ex: billy@gmail.com", text: $viewModel.provider.experience).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("Type:").font(.title2).bold()
                            Spacer()
                            Image(systemName: "homekit").font(.title)
                        }.padding([.top,.leading, .trailing])
                            Divider()
                            Picker(selection: $viewModel.provider.type, label: Text("")){
                                ForEach(providerType.allCases){
                                    Text($0.rawValue).font(.title2)
                                }
                            }
                            Divider()
                        }
                        
                    }
                }.padding().background(Color.yellow).foregroundColor(Color.black).cornerRadius(15.0)
                
                Button(action:{
                    withAnimation{
                        
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Submit")
                        Image(systemName: "chevron.right")
                        Spacer()
                    }.padding().background(Color(.blue), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white).cornerRadius(10.0)
                }.padding().font(.title)
            }.padding()
        }
    }
}

struct ProviderOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        ProviderOnboarding().environmentObject(ViewModel())
    }
}
