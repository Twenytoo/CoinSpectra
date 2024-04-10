//
//  CoinImageViewModel.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-04-05.
//

import SwiftUI
import Combine

final class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let coin: Coin
    private let dataService: CoinImageService
    
    init(coin: Coin) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        
        setupBindings()
    }
    
    private func setupBindings() {
        dataService.imagePublisher
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
                print("Receive completion")
            }, receiveValue: { [weak self] image in
                self?.image = image
                print("Receive value")
            })
            .store(in: &subscriptions)
    }
    
}


