//
//  CustomerOnboarding.swift
//  uri
//
//  Created by user175936 on 2/20/21.
//

import SwiftUI

struct CustomerOnboarding: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            ScrollView{
                Text("We Just Need To Know A Bit About You").font(.title)
                VStack{
                    HStack{
                        Text("Name:").font(.title2).bold()
                        Spacer()
                        Image(systemName: "pencil.circle.fill").font(.title)
                    }.padding([.top,.leading, .trailing])
                    Divider()
                    TextField("name", text: $viewModel.user.name).font(.title2).padding(.horizontal)
                    
                    HStack{
                        Text("Address:").font(.title2).bold()
                        TextEditor(text: $viewModel.user.address).font(.title2).background(Color.red)
                        Spacer()
                        Image(systemName: "pencil.circle.fill").font(.title)
                    }.padding([.top,.leading, .trailing])
                    

                }.padding().background(Color.red).foregroundColor(Color.white).cornerRadius(15.0)
            }.padding()
        }
    }
}

struct CustomerOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOnboarding().environmentObject(ViewModel())
    }
}
