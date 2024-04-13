//
//  HomeViewModel.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-28.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private var subscriptions: Set<AnyCancellable> = []
    private let dataService: CoinDataService = CoinDataNetworkService()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates() 
            .combineLatest(dataService.allCoinPublisher)
            .map { [weak self] text, coins -> [Coin] in
                self?.filterCoins(text: text, coins: coins) ?? []
            }
            .sink { [weak self] coins in
                self?.allCoins = coins
            }.store(in: &subscriptions)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        
        let lowercsedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.name.contains(lowercsedText) ||
            coin.symbol.contains(lowercsedText) ||
            coin.id.contains(lowercsedText)
        }
    }
}
