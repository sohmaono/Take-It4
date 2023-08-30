//
//  experiment2.swift
//  Take-It4
//
//  Created by 小野聡真 on 2023/08/30.
//

import SwiftUI

struct experiment2: View {
    var body: some View {
            Rectangle()
                .stroke(lineWidth: 1.5)
                .foregroundColor(Color.white)
                .overlay{
                    Rectangle()
                }
                .frame(width: 200, height: 200, alignment: .center)
    }
}

struct experiment2_Previews: PreviewProvider {
    static var previews: some View {
        experiment2()
    }
}
