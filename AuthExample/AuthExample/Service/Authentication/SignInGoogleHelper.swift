//
//  SignInGoogleHelper.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 22.02.2025.
//

import Foundation
import GoogleSignIn

struct GoogleSignInModel {
    let idToken:String
    let accessToken:String
    let name:String?
    let email:String?
}

final class SignInGoogleHelper {
    
//    ekranda gosterilecek main threada al
    @MainActor
    func signIn() async throws -> GoogleSignInModel {
        
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSıgnInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSıgnInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSıgnInResult.user.accessToken.tokenString
        let name = gidSıgnInResult.user.profile?.name
        let email = gidSıgnInResult.user.profile?.email
        
        let tokens = GoogleSignInModel(idToken: idToken, accessToken: accessToken, name: name, email: email)
        return tokens
    }
}
