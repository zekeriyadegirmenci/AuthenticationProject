//
//  SignInView.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var vm = AuthenticationVM()
    @State var showSheet:Bool = false
    
    var body: some View {
        NavigationStack
        {
            VStack(spacing: 20)
            {
                CustomTextField(text: $vm.email, placeholder: "E-mail", isSecure: false, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
                
                CustomTextField(text: $vm.password, placeholder: "Password", isSecure: true, backgroundColor: .secondary.opacity(0.5), foregroundColor: .primary)
                
                CustomButton(title: "Log In", backgroundColor: .accentColor, foregroundColor: .white) {
                    vm.signInAccount()
                }.alert("Message", isPresented: $vm.showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(vm.errorMessage)
                }
                
                
                Button {
                    showSheet.toggle()
                    // Forgot Password sayfasını sheet olarak açıyoruz
                } label: {
                    Text("Forgot Password")
                        .foregroundColor(.blue)
                }
                
                HStack {
                    Text("Don't have an Account?")
                        .foregroundStyle(.primary)
                    
                    NavigationLink {
                        SignUpView()
                        //                        signupa bastıgın anda email ve password sıfırlandı
                        
                    } label: {
                        Text("Sign Up")
                    }
                }
            }.padding()
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Log In")
                .sheet(isPresented: $showSheet, content: {
                    ForgotPasswordView(vm: vm)
                        .presentationDetents([.fraction(0.5)])
                })
                .navigationDestination(isPresented: $vm.isSignedIn) {
                    ProfileView(vm: vm)
                }
        }
    }
    
}


#Preview {
    SignInView()
}
