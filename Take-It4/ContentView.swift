//
//  ContentView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 0
    
    init(){
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelection){
                CollectionMainView().tag(0)
                
                SharePictureHomeView().tag(1)
                
                MyPageHomeView().tag(2)
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
            CustomTabView2(num: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environmentObject(PictureViewPageInf())
    }
}