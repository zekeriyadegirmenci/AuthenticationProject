//
//  AuthenticationVM.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import Foundation


final class AuthenticationVM:ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
}
