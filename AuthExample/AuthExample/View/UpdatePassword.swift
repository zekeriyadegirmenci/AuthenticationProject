//
//  UpdatePassword.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 21.02.2025.
//

import SwiftUI

struct UpdatePassword: View {
    
    @ObservedObject var vm:SettingsVM
    
    var body: some View {
        VStack
        {
            Text("Update Password")
                .font(.largeTitle)
            CustomTextField(text: $vm.emailForUpdate, placeholder: "Email", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomTextField(text: $vm.passwordForUpdate, placeholder: "Old Password", isSecure: true, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomTextField(text: $vm.newUpdatedPassword, placeholder: "New Password", isSecure: true, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
            
            CustomButton(title: "Update Password", backgroundColor: .accentColor, foregroundColor: .white) {
                vm.updatePassword()
                
            }
        }.padding()
            .alert("Message", isPresented: $vm.showAlertForUpdate) {
                Button("OK", role: .cancel) {
                }
            } message: {
                Text(vm.errorMessage)
            }
    }
}

#Preview {
    UpdatePassword(vm: SettingsVM())
}
