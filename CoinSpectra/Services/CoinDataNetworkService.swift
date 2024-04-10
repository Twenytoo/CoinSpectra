//
//  CoinDataNetworkService.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-04-02.
//

import Foundation
import Combine

protocol CoinDataService {
    
    var allCoinPublisher: AnyPublisher<[Coin], Never> { get }

}


final class CoinDataNetworkService: CoinDataService {
    
    var allCoinPublisher: AnyPublisher<[Coin], Never> {
        allCoinsSubject.eraseToAnyPublisher()
    }
    
    private var allCoinsSubject = PassthroughSubject<[Coin], Never>()
    private var coinSubscription: AnyCancellable?
    
    private let headers = ["x-cg-demo-api-key": "CG-UeWcDD2ujZcHZPDh3Hgv3P2j"]
    private let coinsDataUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: coinsDataUrl) else { return }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion(completion:),
                  receiveValue: { [weak self] coins in
                self?.allCoinsSubject.send(coins)
                self?.coinSubscription?.cancel()
            })
    }
    
}
