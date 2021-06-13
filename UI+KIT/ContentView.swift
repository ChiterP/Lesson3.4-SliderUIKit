//
//  ContentView.swift
//  UI+KIT
//
//  Created by Алексей Сергейцев on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text ("Подвиньте слайдер, как можно ближе к: \(targetValue) ")
                .padding()
            HStack {
                Text("0")
                SliderUIKit(targetValue: $targetValue, currentValue: $currentValue)
                Text("100")
            }
            .padding()
            ButtonView(title: "Проверь меня!") {
                alertPresented = true
            }
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("You score: "),
                          message: Text("\(computeScore())"))
                }
     
            ButtonView(title: "Начать заново!", action: reloadDate)
                .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    private func reloadDate() {
        let randomTargetValue = Int.random(in: 0...100)
        targetValue = randomTargetValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
