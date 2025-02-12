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
            
            CustomTextField(text: $vm.emailForPassword, placeholder: "Enter an email", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomButton(title: "Send Reset Link", backgroundColor: .accentColor, foregroundColor: .white) {
                vm.forgotPasswordAccount()
            }
        }.padding()
            .alert("Message", isPresented: $vm.showAlert) {
                Button("OK", role: .cancel) { }  // OK butonu
            } message: {
                Text(vm.errorMessage)  // Hata mesajını göster
            }
    }
}

#Preview {
    ForgotPasswordView(vm: AuthenticationVM())
}
