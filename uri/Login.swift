//
//  Login.swift
//  uri
//
//  Created by user175936 on 2/20/21.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            
        VStack{
            Spacer()
            Text("Which Are You?").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold).foregroundColor(.white)
            Spacer()
            Button(action:{
                withAnimation(){
                    viewModel.page = "LoginCustomer"
                }
            }){
                HStack{
                    VStack{
                        Text("Consumer").font(.title).fontWeight(.bold)
                        Text("You Require Services").font(.title3)
                        Image(systemName: "chevron.right.2").font(.title).padding()
                    }.padding()
                }.padding().foregroundColor(.white).background(Color.blue).cornerRadius(15).shadow(radius: 10)
            }.padding(.bottom)
           
            Button(action:{
                withAnimation(){
                    viewModel.page = "LoginProvider"
                }
            }){
                HStack{
                    VStack{
                        Text("Provider").font(.title).fontWeight(.bold)
                        Text("You Provide Services").font(.title3)
                        Image(systemName: "chevron.right.2").font(.title).padding()
                    }.padding()
                }.padding().foregroundColor(.white).background(Color.green).cornerRadius(15).shadow(radius: 10)
            }
            Spacer()
        }.padding(25).background(Color.red).cornerRadius(15).shadow(radius: 15)
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(ViewModel())
    }
}
