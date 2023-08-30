//
//  ContentView.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $tabSelection){
                CollectionContentView().tag(0)
                
//                SharePictureHomeView().tag(1)
                
                MyPageHomeView().tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            CustomTabView2(num: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
