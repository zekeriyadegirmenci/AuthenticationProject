//
//  ProfileView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var vm:AuthenticationVM
    
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
            }
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $vm.isLogOut) {
                SignInView()
            }
    }
}

#Preview {
    ProfileView(vm: AuthenticationVM())
}
