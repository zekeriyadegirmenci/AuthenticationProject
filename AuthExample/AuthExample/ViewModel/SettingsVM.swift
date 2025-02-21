//
//  SettingsVM.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 21.02.2025.
//

import Foundation

@MainActor
final class SettingsVM:ObservableObject {
    
    @Published var isLogOut:Bool = false
    @Published var showAlert:Bool = false
    @Published var errorMessage:String = ""
    
    private let authService = AuthenticationService()
    
    func logoutAccount() {
        do {
            try authService.logOut()
            isLogOut.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetPassword() {
        Task
        {
            do {
                let authUser = try authService.getAuthenticatedUser()
                guard let email = authUser.email else {
                    throw URLError(.fileDoesNotExist)
                }
                try await authService.forgotPassword(email: email)
                self.errorMessage = "Password reset link has been sent to your email."
                showAlert.toggle()
            } catch {
                print(error.localizedDescription)
                self.errorMessage = "An error occurred while resetting your password."
                showAlert.toggle()
            }
        }
    }
}
