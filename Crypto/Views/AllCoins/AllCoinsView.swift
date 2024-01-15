//
//  AllCoinsView.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import SwiftUI

struct AllCoinsView: View {
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("All Coins")
                .font(.title3)
                .fontWeight(.semibold)

            HStack{
                Text("Coin")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)

                Spacer()

                Text("Price")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }

            if viewModel.coinItems.isEmpty{
                ProgressView()
                    .padding(.top, 20)
            }
            else {
                ScrollView(.vertical) {

                    VStack(alignment: .leading, spacing:10, content: {

                        ForEach(viewModel.coinItems) { coin in
                            AllCoinsCell(coinItem: coin)
                        }
                    })
                }
            }

        })
    }
}

#Preview {
    AllCoinsView()
        .environmentObject(HomeViewModel())
}
