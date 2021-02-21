//
//  CustomerProfileView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerProfileView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Text("Hello " + viewModel.user.name).font(.title).fontWeight(.semibold).padding().multilineTextAlignment(.center)
                VStack{
                    ScrollView{
                    VStack{
                    HStack{
                        Text("Name:").font(.title2).bold()
                        Spacer()
                        Image(systemName: "person.fill.badge.plus").font(.title)
                    }.padding([.top,.leading, .trailing])
                    Divider()
                    TextField("Name", text: $viewModel.user.name).font(.title2).padding(.horizontal)
                        Divider()
                    }
                    
                    VStack{
                    HStack{
                        Text("Address:").font(.title2).bold()
                        Spacer()
                        Image(systemName: "house.fill").font(.title)
                    }.padding([.top,.leading, .trailing])
                    Divider()
                    TextField("Address", text: $viewModel.user.address).font(.title2).padding(.horizontal)
                        Divider()
                    }
                    
                    VStack{
                    HStack{
                        Text("Phone Number:").font(.title2).bold()
                        Spacer()
                        Image(systemName: "phone.circle.fill").font(.title)
                    }.padding([.top,.leading, .trailing])
                    Divider()
                    TextField("ex: +1 111-111-1111", text: $viewModel.user.phoneNumber).font(.title2).padding(.horizontal)
                        Divider()
                    }
                    
                    VStack{
                    HStack{
                        Text("Email").font(.title2).bold()
                        Spacer()
                        Image(systemName: "envelope.fill").font(.title)
                    }.padding([.top,.leading, .trailing])
                    Divider()
                    TextField("ex: billy@gmail.com", text: $viewModel.user.email).font(.title2).padding(.horizontal)
                        Divider()
                    }
                    
                    VStack{
                    HStack{
                        Text("Domicile Type:").font(.title2).bold()
                        Spacer()
                        Image(systemName: "homekit").font(.title)
                    }.padding([.top,.leading, .trailing])
                        Divider()
                        Picker(selection: $viewModel.user.domicileType, label: Text("")){
                            ForEach(domicile.allCases){
                                Text($0.rawValue).font(.title2)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        Divider()
                    }

                }.padding().background(Color.orange).foregroundColor(Color.black).cornerRadius(15.0)
                }
                Button(action:{
                    withAnimation{
                        
                    }
                }){
                    HStack{
                        Spacer()
                        Text("Update")
                        Image(systemName: "chevron.right")
                        Spacer()
                    }.padding().background(Color(.blue), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white).cornerRadius(10.0)
                }.padding().font(.title)
            }.padding()
            
        }
    }
}

struct CustomerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerProfileView().environmentObject(ViewModel())
    }
}
