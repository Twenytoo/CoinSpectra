//
//  CoinImageNetworkService.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-04-05.
//

import SwiftUI
import Combine

final class CoinImageService {
    
    var imagePublisher: AnyPublisher<UIImage, Never> {
        imageSubject.compactMap{ $0 }.eraseToAnyPublisher()
    }
    
    private var imageSubscription: AnyCancellable?
    
    private let coin: Coin
    private let fileManager = LocalCacheFileManager.shared
    private let folderName = "coin_images"
    private let imageName: String
    private let imageSubject = CurrentValueSubject<UIImage?, Never>(nil)
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        
        getImage()
    }
    
    private func getImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            imageSubject.send(savedImage)
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .compactMap { UIImage(data: $0) }
            .sink(
                receiveCompletion: NetworkManager.handleCompletion(completion:)
            ) { [weak self] image in
                
                guard let self else { return }
                
                self.imageSubject.send(image)
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
            }
    }
    
}
