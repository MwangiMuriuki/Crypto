//
//  AllCoinsCell.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import SwiftUI

struct AllCoinsCell: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let coinItem: CoinModel

    var body: some View {
        HStack(spacing: 10, content: {
            Text("\(coinItem.marketCapRank ?? 1)")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)

//            Image(systemName: "bitcoinsign.circle.fill")
//                .resizable()
//                .frame(width: 32, height: 32)

            AsyncImage(url: URL(string: coinItem.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "bitcoinsign.circle.fill")
            }

            VStack(alignment:.leading, spacing:2, content: {
                Text(coinItem.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                Text(coinItem.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            })

            Spacer()

            VStack(alignment: .trailing, spacing:2, content: {
                Text("$\(coinItem.currentPrice)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                if coinItem.priceChangePercentage24H.description.contains("-") {
                    Text("\(coinItem.priceChangePercentage24H )%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.redLabel)
                }
                else {
                    Text("\(coinItem.priceChangePercentage24H )%")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.greenLabel)
                }

            })
        })
        .padding(.bottom, 20)

    }
}

//#Preview {
//    AllCoinsCell(, coinItem: CoinModel()
//}
