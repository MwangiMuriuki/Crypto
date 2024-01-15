//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    private let serviceCaller = ServiceCaller()
    @Published var coinItems  = [CoinModel]()
    @Published var topMoverItems  = [CoinModel]()


    public func fetchCoinData(){
        DispatchQueue.main.async { [weak self] in
            self?.serviceCaller.fetchData{ result in
                switch result {
                case .success(let models):
                    self?.coinItems = models
                    self?.configureTopMovers()
                case .failure(_):
                    self?.coinItems = []
                    break
                }
            }
        }
    }

    func configureTopMovers(){
        let topMovers = coinItems.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMoverItems = Array(topMovers.prefix(10))
    }
}
