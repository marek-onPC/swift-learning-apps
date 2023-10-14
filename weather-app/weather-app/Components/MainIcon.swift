//
//  MainIcon.swift
//  weather-app
//
//  Created by Marek on 2023/10/10.
//

import SwiftUI

struct MainIcon: View {
    var icon: String?
    var tempValue: Double?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon ?? "exclamationmark.square")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            // "specifier" used to round to two decimal places
            Text("\(tempValue ??  0, specifier: "%.2f")°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        Spacer()
    }
}
