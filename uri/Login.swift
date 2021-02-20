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
        VStack{
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(ViewModel())
    }
}
