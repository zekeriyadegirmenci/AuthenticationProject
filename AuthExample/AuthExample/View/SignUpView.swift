//
//  SignUpView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var vm:AuthenticationVM
    
    var body: some View {
        VStack(spacing: 20)
        {
            Text("Please Sign up")
            CustomTextField(text: $vm.email, placeholder: "Enter an E-mail", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomTextField(text: $vm.password, placeholder: "Enter Password", isSecure: true, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomButton(title: "Sign Up", backgroundColor: .accentColor, foregroundColor: .white) {
//                    action SignIN
            }
        }.padding()
    }
}

#Preview {
    SignUpView(vm: AuthenticationVM())
}
