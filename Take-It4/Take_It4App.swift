//
//  Take_It4App.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/23.
//

import SwiftUI

@main
struct Take_It4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PracticeForMP())
        }
    }
}
