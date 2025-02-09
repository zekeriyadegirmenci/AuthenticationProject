//
//  SignInView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var vm = AuthenticationVM()
    
    var body: some View {
        NavigationStack
        {
            VStack(spacing: 20)
            {
                CustomTextField(text: $vm.email, placeholder: "E-mail", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
                
                CustomTextField(text: $vm.password, placeholder: "Password", isSecure: true, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
                
                CustomButton(title: "Log In", backgroundColor: .accentColor, foregroundColor: .white) {
//                    action SignIN
                }
            }.padding()
        }

    }
}

#Preview {
    SignInView()
}
