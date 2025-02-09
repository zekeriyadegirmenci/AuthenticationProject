//
//  ForgotPasswordView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @ObservedObject var vm:AuthenticationVM
    
    var body: some View {
        VStack(spacing: 20)
        {
            Text("Please enter your email address for Reset Link")
            
            CustomTextField(text: $vm.email, placeholder: "Enter an email", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .white)
            
            CustomButton(title: "Send Reset Link", backgroundColor: .accentColor, foregroundColor: .white) {
                // for reset link
            }
        }.padding()
    }
}

#Preview {
    ForgotPasswordView(vm: AuthenticationVM())
}
