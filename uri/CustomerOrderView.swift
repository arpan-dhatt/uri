//
//  CustomerOrderView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerOrderView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        if viewModel.customerOrderPage == "1"{
            CustomerOrderViewIntro()
        }
        else if viewModel.customerOrderPage == "2" {
            CustomerOrderTwoView()
        }
        else if viewModel.customerOrderPage == "3" {
            CustomerOrderThreeView()
        }
        else if viewModel.customerOrderPage == "4" {
            CustomerOrderFourView()
        }
    }
}

struct CustomerOrderViewIntro: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("What's The Problem?").font(.title).fontWeight(.bold).multilineTextAlignment(.leading)
                    Spacer()
                }.padding()
                VStack{
                    HStack{
                        Text("Which Technician Do You Require?").font(.headline)
                        Spacer()
                    }.padding()
                    Picker(selection: $viewModel.provider.type, label: Text("")){
                        ForEach(providerType.allCases){
                            Text($0.rawValue).font(.title2).textCase(.uppercase)
                        }
                    }.padding(.vertical, -20)
                }
                
                ScrollView{
                    HStack{
                        Text("These Are The Best Technicians").font(.headline)
                        Spacer()
                    }.padding()
                    Text("AI Generated Shiit goes here")
                }
                
                HStack{
                    Spacer()
                    Button(action:{
                        withAnimation{
                        viewModel.customerOrderPage = "2"
                        }
                    }){
                        HStack{
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(.white).shadow(radius: 10.0)
                    }
                    Spacer()
                    
                }
                
                
            }.padding()
        }
    }
}

struct CustomerOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderView().environmentObject(ViewModel())
    }
}
