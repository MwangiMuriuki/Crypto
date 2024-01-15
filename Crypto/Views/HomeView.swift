//
//  ContentView.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var coinsList = [CoinModel]()

    var body: some View {
        NavigationView{
            ScrollView(.vertical) {

                VStack(alignment:.leading, content: {
                    // Top Movers
                    Text("Top Movers")
                        .font(.title3)
                        .fontWeight(.semibold)

                    TopMoversView()
                    .environmentObject(viewModel)

                    Divider()
                        .padding(.top, 8)
                        .padding(.bottom, 8)


                    // All Coins
                    AllCoinsView()
                    .environmentObject(viewModel)
                })
                .padding()

            }
            .navigationTitle("Crypto Prices")

        }
        .onAppear(perform: {
            viewModel.fetchCoinData()
        })

    }
}

#Preview {
    HomeView()
}
