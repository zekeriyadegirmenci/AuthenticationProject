//
//  ProfileView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var vm = SettingsVM()
    
    var body: some View {
        VStack
        {
            List {
                Button {
                    vm.logoutAccount()
                } label: {
                    Text("Log Out")
                        .foregroundStyle(.red)
                }
                
                Button {
                    vm.resetPassword()
                } label: {
                    Text("Reset Password")
                        .foregroundStyle(.primary)
                }

            }
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $vm.isLogOut) {
                SignInView()
            }
            .alert("Message", isPresented: $vm.showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(vm.errorMessage)
            }

    }
}

#Preview {
    ProfileView()
}
