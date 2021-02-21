//
//  CustomerOrderTwoView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerOrderTwoView: View {
    @EnvironmentObject var viewModel: ViewModel
    //, "11:00", "12:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", "7:00", "8:00", "9:00", "10:00"]
    //make this list dynamic
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Select The Best Time").font(.title).bold()
                    Spacer()
                }.padding(.vertical)
                ScrollView{
                ForEach(0..<viewModel.timeSlots.count){i in
                    timeSlotView(index: i)
                }
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action:{
                        withAnimation{
                            viewModel.customerOrderPage = "1"
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
                            viewModel.customerOrderPage = "3"
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

struct timeSlotView: View {
    @EnvironmentObject var viewModel: ViewModel
    var index: Int
    
    var body: some View {
        VStack{
            if viewModel.timeSlots[index][1] == "Y"{
            HStack{
                Spacer()
                Text(viewModel.timeSlots[index][0]).font(.headline)
                Spacer()
            }.padding().background(Color.gray).cornerRadius(10.0).onTapGesture {
                withAnimation{
                for i in 0..<viewModel.timeSlots.count {
                    if(viewModel.timeSlots[i][1] != "N"){
                        if(viewModel.timeSlots[i][0] != viewModel.timeSlots[index][0]){
                            viewModel.timeSlots[i][1] = "Y"
                        }
                        else{
                            viewModel.timeSlots[i][1] = "S"
                            }
                        }
                    }
                }
            }
            }
            
            else if viewModel.timeSlots[index][1] == "S"{
                HStack{
                    Spacer()
                    Text(viewModel.timeSlots[index][0]).font(.headline)
                    Spacer()
                }.padding().background(Color.green).cornerRadius(10.0)
            }
            
        else{
            HStack{
                Spacer()
                Text(viewModel.timeSlots[index][0]).font(.headline)
                Spacer()
            }.padding().background(Color.red).cornerRadius(10.0)
        }
        }
    }
}

struct CustomerOrderTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderTwoView().environmentObject(ViewModel())
    }
}
