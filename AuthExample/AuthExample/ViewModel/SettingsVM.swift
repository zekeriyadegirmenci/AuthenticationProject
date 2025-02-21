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
    @Published var showSheet:Bool = false
    @Published var showAlertForUpdate:Bool = false
    @Published var errorMessage:String = ""
    @Published var emailForUpdate:String = ""
    @Published var passwordForUpdate:String = ""
    @Published var newUpdatedPassword:String = ""
    
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
    
    func updatePassword() {
        Task
        {
            do {
                try await authService.reauthenticateAndUpdatePassword(email: emailForUpdate, currentPassword: passwordForUpdate, newPassword: newUpdatedPassword)
                self.errorMessage = "Updated Password"
                showAlertForUpdate.toggle()
                showSheet.toggle()
            } catch {
                showAlertForUpdate.toggle()
                print(error.localizedDescription)
                self.errorMessage = "An error occurred while updating your password."
            }
        }
    }
}
