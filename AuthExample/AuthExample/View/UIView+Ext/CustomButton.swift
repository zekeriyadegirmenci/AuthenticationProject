//
//  CustomButton.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 9.02.2025.
//

import SwiftUI

struct CustomButton: View {
    
    var title:String
    var backgroundColor:Color
    var foregroundColor:Color
    var action:() -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
                .clipShape(.rect(cornerRadius: 10))
        }

    }
}

#Preview {
    CustomButton(title: "title", backgroundColor: Color.red, foregroundColor: Color.yellow, action: {
        print("Button clicked")
    })
}
