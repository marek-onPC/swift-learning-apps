//
//  SwiftUIView.swift
//  weather-app
//
//  Created by Marek on 2023/10/18.
//

import SwiftUI

struct EmptyCityPlaceholder: View {
    var body: some View {
        Text("Search for \n weather")
            .font(.system(size: 48, weight: .light))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        Image(systemName: "magnifyingglass")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
    }
}
