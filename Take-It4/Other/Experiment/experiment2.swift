//
//  experiment2.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct experiment2: View {
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                Rectangle()
                    .opacity(0.5)
                    .frame(width: 200, height: 200)
                    .onAppear{
                        print(geo.safeAreaInsets.top)
                    }
            }
            .background{
                Color.blue
            }
        }
    }
}

struct experiment2_Previews: PreviewProvider {
    static var previews: some View {
        experiment2()
    }
}
