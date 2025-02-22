//
//  AuthenticationService.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import Foundation
import FirebaseAuth

actor AuthenticationService {
    
    
    nonisolated func getAuthenticatedUser() throws -> UserModel {
        guard let user = Auth.auth().currentUser else {
            print("Don't get authenticated user")
            throw URLError(.badServerResponse)
        }
//        Eğer ki bunu yapmaz isek, uyarı gosterecek ancak uygulamadan cıkıp girdigimizde girmiş varsayacak. VMdeki usersessiona buradan hata giderse isSignedIn i true yapmaz. Usersessionun amacı kullanıcının girildi bilgisini tutmak.Buradan hata gondermezsek, kullanıcı verify etmeden bir sonrakinde giris yapabilir usersessionu true donecegı ıcın
        if user.isEmailVerified == false {
            throw AuthErrorCode.appNotVerified
        }
        return UserModel(user: user)
    }
    
    nonisolated func logOut() throws{
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
            throw error
        }
    }
    
}

// MARK: SIGN IN EMAİL

extension AuthenticationService {
    
    func createUser(email:String, password:String) async throws -> UserModel {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
//            let user = authResult.user
//            return user get rid of this lines. We create own model and transfering own model from firebase
            
            try await authResult.user.sendEmailVerification()
            
            let user = UserModel(user: authResult.user)
            return user
        } catch {
//            error by firebase service
            print(error.localizedDescription)
//            yakaladın catchle ve gonderdin erroru
            throw error
        }
    }
    
    func signIn(email:String, password:String) async throws -> UserModel {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            let user = UserModel(user: authResult.user)
            
            if authResult.user.isEmailVerified == false {
                try logOut()
                throw AuthErrorCode.appNotVerified
            }
            
            return user
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func forgotPassword(email:String) async throws {
        do {
//            kullanıcı kimligini dogrulamaz sadece password reset linki gonderir
            try await Auth.auth().sendPasswordReset(withEmail: email)
            print("Password reset email sent to \(email)")
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func reauthenticateAndUpdatePassword(email: String, currentPassword: String, newPassword: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
        
        do {
            // Kullanıcıyı yeniden kimlik doğrula
            try await user.reauthenticate(with: credential)
            
            // Kimlik doğrulandıktan sonra şifreyi güncelle
            try await user.updatePassword(to: newPassword)
            
            print("Password successfully updated")
            
        } catch {
            print("Error reauthenticating: \(error.localizedDescription)")
            throw error
        }
    }
}

//  MARK: SIGN IN SSO

extension AuthenticationService {
    
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInModel) async throws -> UserModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken )
        return try await signIn(credential: credential)
    }
    
    func signIn(credential:AuthCredential) async throws -> UserModel {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        let user = UserModel(user: authDataResult.user)
        return user
    }
    
}
