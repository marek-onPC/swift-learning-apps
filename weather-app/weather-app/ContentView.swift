//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                TodayView()
                    .tabItem {
                        // SF Symbols
                        Image(systemName: "sun.max.fill")
                        // Label text
                        Text("Today")
                    }
                WeekView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Week")
                    }
            }
            .toolbarBackground(.blue, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        // To define accent color of the selcted Tab button
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
