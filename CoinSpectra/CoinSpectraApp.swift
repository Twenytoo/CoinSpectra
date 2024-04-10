//
//  CoinSpectraApp.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-04.
//

import SwiftUI

@main
struct CoinSpectraApp: App {
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
                    .environmentObject(viewModel)
            }
        }
    }
}
