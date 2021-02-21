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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomerOrderFourView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderFourView().environmentObject(ViewModel())
    }
}
