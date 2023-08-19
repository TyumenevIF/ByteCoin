//
//  CoinView.swift
//  ByteCoin
//
//  Created by Ilyas Tyumenev on 19.08.2023.
//

import UIKit
import SnapKit

class CoinView: UIView {
    
    // MARK: - Properties    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let coinView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .tertiaryLabel
        return view
    }()
    
    private let bitCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(named: "Icon Color")
        return imageView
    }()
    
    let bitcoinLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    lazy var coinStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        [self.bitCoinImageView,
         self.bitcoinLabel,
         self.currencyLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 25
        [self.topLabel,
         self.coinView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    let currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.contentMode = .scaleToFill
        return picker
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setSubviews() {
        coinView.addSubview(coinStackView)
        addSubview(mainStackView)
        addSubview(currencyPicker)
    }
    
    private func setupConstraints() {
        topLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(230)
            make.height.equalTo(60)
        }
        
        coinView.snp.makeConstraints { make in
            make.top.equalTo(coinStackView.snp.top)
            make.leading.equalTo(coinStackView.snp.leading)
            make.trailing.equalTo(coinStackView.snp.trailing).offset(10)
            make.height.equalTo(80)
        }
        
        bitCoinImageView.snp.makeConstraints { make in
            make.top.equalTo(coinStackView.snp.top)
            make.bottom.equalTo(coinStackView.snp.bottom)
        }
        
        bitcoinLabel.snp.makeConstraints { make in
        }
        
        currencyLabel.snp.makeConstraints { make in
        }
        
        coinStackView.snp.makeConstraints { make in
            make.trailing.equalTo(coinView.snp.trailing).inset(10)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(10)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
        }
        
        currencyPicker.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
