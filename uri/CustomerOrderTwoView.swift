//
//  CustomerOrderTwoView.swift
//  uri
//
//  Created by user175571 on 2/20/21.
//

import SwiftUI

struct CustomerOrderTwoView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomerOrderTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerOrderTwoView().environmentObject(ViewModel())
    }
}
