//
//  SliderUIKit.swift
//  UI+KIT
//
//  Created by Алексей Сергейцев on 6/11/21.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var targetValue: Int
    @Binding var currentValue: Float

     func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.tintColor = .red

        return slider
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        currentValue = uiView.value
        uiView.thumbTintColor = .green.withAlphaComponent(1)

    }
}

extension SliderUIKit{
    
    class Coordinator: NSObject{
        @Binding var currentValue: Float
        
        init(value: Binding<Float>) {
            self._currentValue = value
        }
    }
}


struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(
            targetValue: .constant(1),
            currentValue: .constant(100)
        )
    }
}
