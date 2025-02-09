//
//  CustomTextField.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text:String
    var placeholder:String
    var isSecure:Bool
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .padding()
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(.rect(cornerRadius: 10))
        }else{
            TextField(placeholder, text: $text)
                .padding()
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    CustomTextField(text: .constant("Text"), placeholder: "Placeholder", isSecure: true, backgroundColor: Color.secondary, foregroundColor: Color.blue)
    CustomTextField(text: .constant("Text"), placeholder: "Placeholder", isSecure: false, backgroundColor: Color.secondary, foregroundColor: Color.blue)
}
