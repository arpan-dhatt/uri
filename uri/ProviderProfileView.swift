//
//  ProviderProfileView.swift
//  uri
//
//  Created by user175571 on 2/21/21.
//

import SwiftUI

struct ProviderProfileView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var showImagePicker = false
    @State var pickedImage: UIImage? = nil
    
    var body: some View {
        ZStack{
            VStack{
                Text("Hello " + viewModel.provider.name).font(.title).fontWeight(.semibold).padding().multilineTextAlignment(.center)
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
                            Image(systemName: "pencil.circle.fill").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                            TextField("ex: billy@gmail.com", text: $viewModel.provider.aboutMe).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                        HStack{
                            Text("Experience").font(.title2).bold()
                            Spacer()
                            Image(systemName: "person.fill.checkmark").font(.title)
                        }.padding([.top,.leading, .trailing])
                        Divider()
                            TextField("ex: billy@gmail.com", text: $viewModel.provider.experience).font(.title2).padding(.horizontal)
                            Divider()
                        }
                        
                        VStack{
                            HStack{
                                Text("Profile Picture").font(.title2).bold()
                                Spacer()
                                Image(systemName: "photo.fill").font(.title)
                            }.padding([.top,.leading, .trailing])
                                Divider()
                            Button(action: {self.showImagePicker.toggle()}, label: {
                                HStack{
                                    Spacer()
                                    Text("Pick Image").font(.title2)
                                    Image(systemName: "plus").font(.title2)
                                    Spacer()
                                }.padding().background(Color(.blue)).foregroundColor(.white).cornerRadius(10).padding()
                            })
                            Divider()
                            if pickedImage != nil {
                                HStack{
                                    Text("Selected Profile Picture").font(.title2).bold()
                                    Spacer()
                                }
                                Image(uiImage: pickedImage!).resizable().scaledToFit().cornerRadius(10.0).padding()
                                
                            }
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
                                    Text($0.rawValue).font(.title2).textCase(.uppercase)
                                }
                            }
                            Divider()
                        }
                        
                    }
                }.padding().background(Color.orange).foregroundColor(Color.black).cornerRadius(15.0).sheet(isPresented: $showImagePicker, onDismiss: {self.showImagePicker = false}, content: {
                    ImagePicker(image: $pickedImage, isShown: $showImagePicker)
                })
                
                Button(action:{
                    withAnimation{
                        viewModel.provider.profilePic = pickedImage!
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

struct ProviderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProviderProfileView().environmentObject(ViewModel())
    }
}
