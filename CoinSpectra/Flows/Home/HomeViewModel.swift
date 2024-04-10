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
    
    private var subscriptions: Set<AnyCancellable> = []
    private let dataService: CoinDataService = CoinDataNetworkService()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        dataService.allCoinPublisher
            .sink { [weak self] coins in
                self?.allCoins = coins
            }.store(in: &subscriptions)
    }
}
