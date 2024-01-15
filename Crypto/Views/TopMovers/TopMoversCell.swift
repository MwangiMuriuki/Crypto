//
//  TopMoversCell.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import SwiftUI

struct TopMoversCell: View {
    let coinItem: CoinModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
//            Image(systemName: "bitcoinsign.circle.fill")
//                .resizable()
//                .frame(width: 34, height: 34)

            AsyncImage(url: URL(string: coinItem.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "bitcoinsign.circle.fill")
            }

            HStack(spacing:2, content: {
                Text(coinItem.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)

                Text("$\(coinItem.priceChange24H)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            })

            Text("+ \(coinItem.priceChangePercentage24H)%")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.greenLabel)

        })
        .frame(width: 140, height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary, lineWidth: 2)
                .cornerRadius(10)
                .shadow(radius: 10)
        )

    }
}

//#Preview {
//    TopMoversCell(coinItem: CoinModel())
//}
