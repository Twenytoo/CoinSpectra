//
//  HomeView.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-04.
//

import SwiftUI

struct HomeView: View {
     
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var showPorfolio: Bool = false
    
    var body: some View {
        ZStack {
//            background layer
            Color.theme.background
                .ignoresSafeArea()
            
//            content layer
            VStack {
                headerView
                
                columnTitles
                
                if !showPorfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView {
    
    private var headerView: some View {
        HStack {
            CircleButtonView(iconName: showPorfolio ? "plus" : "info")
                .transaction { $0.animation = nil }
                .background (
                    CircleButtonAnimationView(animate: $showPorfolio)
                )
            
            Spacer()
            
            Text(showPorfolio ? "Porfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPorfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPorfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(viewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(viewModel.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            Text ("Coin")
            Spacer ()
            if showPorfolio {
                Text ("Holdings")
            }
            Text("Price")
                .frame (width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}

#Preview {
    NavigationView {
        HomeView()
            .toolbar(.hidden, for: .navigationBar)
            .environmentObject(StubBuilder.homeViewModel)
    }
}
