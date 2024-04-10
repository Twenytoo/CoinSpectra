//
//  StubBuilder.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-20.
//

import Foundation

struct StubBuilder {
    
    private init () {}
    
    static let homeViewModel = HomeViewModel()
    
    static let coin = Coin(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 64276,
        marketCap: 1257145461239,
        marketCapRank: 1,
        fullyDilutedValuation: 1342858180534,
        totalVolume: 68710284814,
        high24h: 65527,
        low24h: 60914,
        priceChange24h: 1221.95,
        priceChangePercentage24h: 1.93795,
        marketCapChange24h: 18824591062,
        marketCapChangePercentage24h: 1.52017,
        circulatingSupply: 19659600.0,
        totalSupply: 21000000.0,
        maxSupply: 21000000.0,
        ath: 73738,
        athChangePercentage: -13.27988,
        athDate: "2024-03-14T07:10:36.635Z",
        atl: 67.81,
        atlChangePercentage: 94202.56698,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2024-03-20T12:27:29.810Z",
        priceChangePercentage24HInCurrency: nil,
        currentHoldings: nil
    )
    
}
