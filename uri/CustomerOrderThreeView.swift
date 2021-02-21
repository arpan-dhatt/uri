//
//  CustomerOrderThreeView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI
import AVKit

struct CustomerOrderThreeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State var showVideoPicker = false
    @State var pickedVideo: URL? = nil
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Select a video").font(.title).fontWeight(.bold).padding()
                    Spacer()
                }
                
                ScrollView{
                    
                    VStack{
                        HStack{
                            Text("Videos").font(.title2).bold()
                            Spacer()
                            Image(systemName: "video.fill.badge.plus").font(.title)
                        }.padding([.top,.leading, .trailing])
                            Divider()
                        Button(action: {self.showVideoPicker.toggle()}, label: {
                            HStack{
                                Spacer()
                                Text("Pick Video").font(.title2)
                                Image(systemName: "plus").font(.title2)
                                Spacer()
                            }.padding().background(Color(.blue)).foregroundColor(.white).cornerRadius(10).padding()
                        })
                        Divider()
                        if pickedVideo != nil {
                            VStack{
                            HStack{
//                                Text("Selected Profile Picture: \(pickedVideo!)").font(.title2).bold()
                                Spacer()
                            }
                                VideoPlayer(player: AVPlayer(url: pickedVideo!)).scaledToFill()
                            }
                        }
                    }

                }
                
                HStack{
                    Spacer()
                    Button(action:{
                        withAnimation{
                            viewModel.customerOrderPage = "2"
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
                            viewModel.customerOrderPage = "4"
                        }
                    }){
                        HStack{
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(.white).shadow(radius: 10.0)
                    }
                    Spacer()
                    
                }

            }.padding().sheet(isPresented: $showVideoPicker, onDismiss: {self.showVideoPicker = false}, content: {
                VideoPicker(video: $pickedVideo, isShown: $showVideoPicker)
            })
        }
    }
}

struct CustomerOrderThreeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderThreeView().environmentObject(ViewModel())
    }
}
