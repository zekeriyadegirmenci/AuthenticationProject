//
//  AuthenticationService.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import Foundation
import FirebaseAuth

actor AuthenticationService {

    
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
    
    nonisolated func logOut() throws{
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
}
