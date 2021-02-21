//
//  CustomerOrderFinalView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerOrderFinalView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var additonalInfo: String = "Anything Else?"
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Additional Information").font(.title).fontWeight(.bold).padding()
                    Spacer()
                }
                
                ScrollView{
                    VStack{
                        HStack{
                            Text("Enter Any Additional Info Below:").font(.headline)
                            Spacer()
                        }
                        TextEditor(text: $additonalInfo).foregroundColor(.gray)
                    }.padding().background(Color.black).foregroundColor(.white).cornerRadius(10.0)
                    
                    
                }
                
                HStack{
                    Spacer()
                    Button(action:{
                        withAnimation{
                            viewModel.customerOrderPage = "4"
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
                            viewModel.additionalNotes = additonalInfo
                            viewModel.customerOrderPage = "1"
                        }
                    }){
                        HStack{
                            Text("Submit")
                            Image(systemName: "arrow.right")
                        }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(.white).shadow(radius: 10.0)
                    }
                    Spacer()
                    
                }
            }.padding()
        }
    }
}

struct CustomerOrderFinalView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderFinalView().environmentObject(ViewModel())
    }
}
