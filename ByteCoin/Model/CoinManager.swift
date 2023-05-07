//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Ilyas Tyumenev on 07.05.2023.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4A94495E-DEDF-4756-A3B1-3571578FA894"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let bitcoinPrice = parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
        } catch {
            print(error)
            return nil
        }
    }
}
