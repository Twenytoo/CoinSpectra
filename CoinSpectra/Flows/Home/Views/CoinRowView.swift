//
//  CoinRowView.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-20.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                leftColumn
                
                Spacer()
                
                if showHoldingsColumn {
                    centerColumn
                }
                
                rightColumn
                    .frame (width: geometry.size.width / 3.5, alignment: .trailing)
            }
            .font(.subheadline)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text (coin.rank.description)
                .font (.caption)
                .foregroundColor (Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            //                todo: change
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            //                todo: change
            Text((coin.priceChange24h ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text((coin.priceChangePercentage24h ?? 0).asPercentString())
                .foregroundStyle(
                    (coin.priceChangePercentage24h ?? 0) >= 0 ?
                    Color.theme.green :
                        Color.theme.red
                )
        }
    }
}

#Preview {
    CoinRowView(coin: StubBuilder.coin, showHoldingsColumn: true)
        .previewLayout(.sizeThatFits)
}
