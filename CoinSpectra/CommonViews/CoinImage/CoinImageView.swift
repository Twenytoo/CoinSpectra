//
//  CoinImageView.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-04-05.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(coin: Coin) {
        self._viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
             Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
    
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: StubBuilder.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
}
