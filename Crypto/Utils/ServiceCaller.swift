//
//  ServiceCaller.swift
//  Crypto
//
//  Created by Ernest Mwangi on 15/01/2024.
//

import Foundation


final class ServiceCaller {
    init(){}

    struct Constants{
        static let BaseUrl = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=240&page=1&sparkline=true&price_change_percentage=1h%2C24h&locale=en&precision=2")
    }

    public func fetchData(completion: @escaping(Result<[CoinModel], Error>) -> Void) {
        print("Fetching Listings.... ")

        guard let apiUrl = Constants.BaseUrl else{
            return
        }

        let request = URLRequest(url: apiUrl)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response Code - \(response.statusCode)")
            }

            guard let data = data, error == nil else{
                return
            }
            do{
                let coinDataResponse = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(.success(coinDataResponse))

                let decoded = try? JSONSerialization.jsonObject(with: data)
                print("Success Fetching Listings:", String(describing: decoded))
                NSLog("NSSuccess: ", String(describing: decoded))


            }
            catch{
                completion(.failure(error))
                print("Error Fetching Listings:", error)
                NSLog("NSError: \(error)", error.localizedDescription)
            }

        }

        task.resume()

    }

}

