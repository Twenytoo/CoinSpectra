//
//  CircleButtonView.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-04.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
                )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10
            )
            .padding()
                
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
        }
    }
}
