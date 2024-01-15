//
//  TopMovers.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import SwiftUI

struct TopMoversView: View {
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {

            if viewModel.topMoverItems.isEmpty{
                ProgressView()
                    .padding(.top, 20)
            }
            else{
                ScrollView(.horizontal) {
                    HStack(spacing: 12, content: {
                        ForEach(viewModel.topMoverItems, content: { coin in

                            TopMoversCell(coinItem: coin)

                        })
                    })
                }
            }

        })
    }

     
}

#Preview {
    TopMoversView()
        .environmentObject(HomeViewModel())
}
