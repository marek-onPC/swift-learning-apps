//
//  BackgroundChangeButton.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct BackgroundChangeButton: View {
    var buttonLabel: String
    var callback: () -> Void

    var body: some View {
        Button {
            callback()
        } label: {
            Text(buttonLabel)
                .padding(16)
        }
            .foregroundColor(.blue)
            .background(.white)
            .font(.system(size: 16, weight: .bold, design: .default))
            .cornerRadius(5)
        Spacer()
    }
}
