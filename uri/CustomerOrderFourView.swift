//
//  CustomerOrderFourView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerOrderFourView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var showImagePicker = false
    @State var pickedImage: UIImage? = nil
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Select a Picture").font(.title).fontWeight(.bold).padding()
                    Spacer()
                }
                
                ScrollView{
                    VStack{
                        HStack{
                            Text("Image of Issue").font(.title2).bold()
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
                                Text("Selected Picture Of Damage").font(.title2).bold().padding()
                                Spacer()
                            }
                            Image(uiImage: pickedImage!).resizable().scaledToFit().cornerRadius(10.0).padding()
                            
                        }
                    }

                }
                
                HStack{
                    Spacer()
                    Button(action:{
                        withAnimation{
                            viewModel.customerOrderPage = "3"
                        }
                    }){
                        HStack{
                            Image(systemName: "arrow.left")
                            Text("Back")
                        }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(.white).shadow(radius: 10.0)
                    }
                    Spacer()
                    Button(action:{
                        withAnimation{
                            viewModel.customerOrderPage = "5"
                        }
                    }){
                        HStack{
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(.white).shadow(radius: 10.0)
                    }
                    Spacer()
                    
                }

            }.padding().sheet(isPresented: $showImagePicker, onDismiss: {self.showImagePicker = false}, content: {
                ImagePicker(image: $pickedImage, isShown: $showImagePicker)
            })
        }
    }
}

struct CustomerOrderFourView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderFourView().environmentObject(ViewModel())
    }
}
