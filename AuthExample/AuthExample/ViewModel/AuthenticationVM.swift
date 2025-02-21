//
//  AuthenticationVM.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import Foundation
import FirebaseAuth

@MainActor
final class AuthenticationVM:ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var emailForPassword:String = ""
//    user
    @Published var user:UserModel?
    @Published var showAlert:Bool = false
    @Published var errorMessage:String = ""
    @Published var isSignedIn:Bool = false
    @Published var isLogOut:Bool = false
    
    private let authService = AuthenticationService()
    
    init() {
        checkUserSession()
    }
    
//    user session
    func checkUserSession() {
        do {
            let authenticatedUser = try authService.getAuthenticatedUser()
            print(authenticatedUser)
            self.user = authenticatedUser
            isSignedIn.toggle() // var olan kullanıcı için oturum güncellenir
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createAccount() {
        Task
        {
            do {
              let newUser = try await authService.createUser(email: email, password: password)
                self.user = newUser
                self.showAlert = true
                self.errorMessage = "Successfully created!"
                print("User created!, uid: \(newUser.uid)")
            } catch {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
//                error by viewmodel (service catch error message,catch and throw to viewmodel for catch  )
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func signInAccount() {
        Task
        {
            do {
                let signInUser = try await authService.signIn(email: email, password: password)
                self.user = signInUser
                isSignedIn.toggle( )
                print("User sign In, uid:\(signInUser.uid)")
                
            } catch {
                self.errorMessage = error.localizedDescription
                self.showAlert.toggle()
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func forgotPasswordAccount() {
        Task
        {
            do {
                try await authService.forgotPassword(email: emailForPassword)
                self.errorMessage = "Password reset email sent!"
                self.showAlert.toggle()
                print("Password reset email sent to \(emailForPassword)")
            } catch {
                self.errorMessage = error.localizedDescription
                self.showAlert.toggle()
                print("Failed to send password reset email: \(error.localizedDescription)")
            }
        }
    }
    
    func logoutAccount() {
        do {
            try authService.logOut()
            isLogOut.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
