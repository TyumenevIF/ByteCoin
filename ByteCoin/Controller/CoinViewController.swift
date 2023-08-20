//
//  CoinViewController.swift
//  ByteCoin
//
//  Created by Ilyas Tyumenev on 07.05.2023.
//

import UIKit

class CoinViewController: UIViewController {
    
    private let coinView = CoinView()
    var coinManager = CoinManager()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background Color")
        coinView.currencyPicker.dataSource = self
        coinView.currencyPicker.delegate = self
        coinManager.delegate = self
        
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(coinView)
    }
    
    private func setupConstraints() {
        coinView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UIPickerViewDataSource
extension CoinViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

// MARK: - UIPickerViewDataSource
extension CoinViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

// MARK: - CoinManagerDelegate
extension CoinViewController: CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.coinView.bitcoinLabel.text = price
            self.coinView.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
