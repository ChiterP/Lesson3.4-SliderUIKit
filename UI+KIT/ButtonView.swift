//
//  Button.swift
//  UI+KIT
//
//  Created by Алексей Сергейцев on 6/11/21.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.blue)
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            title: "Название кнопки",
            action: {}
        )
    }
}
