//
//  TDetailBoxView.swift
//  TDetailBoxView
//
//  Created by Nguyen, Thinh on 04/08/2022.
//

import Foundation
import UIKit
import TTipBoxView
import TTouchAnimatedButton

open class TDetailBoxView: UIView {
    // MARK: - Private Properties
    private let stackView = UIStackView()
    private let contentStackView = UIStackView()
    
    private let tipBox = TTipBoxView(spacing: 12)
    
    private let titleLabel = UILabel()
    
    // MARK: - Public Properties
    public let button = TTouchAnimatedButton()
    
    public init() {
        super.init(frame: .zero)
        addSubviews()
        setupSubviews()
        setupLayout()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
}

// MARK: - Private Functions
extension TDetailBoxView {
    private func addSubviews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentStackView)
        stackView.addArrangedSubview(tipBox)
        stackView.addArrangedSubview(button)
        addSubview(stackView)
    }
    
    private func setupSubviews() {
        /// stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        if #available(iOS 11.0, *) {
            stackView.setCustomSpacing(16, after: titleLabel)
            stackView.setCustomSpacing(16, after: contentStackView)
            stackView.setCustomSpacing(16, after: tipBox)
        }
        
        stackView.layoutMargins = .init(top: 12, left: 16, bottom: 12, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        /// titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .blue
        titleLabel.isHidden = true
        titleLabel.textAlignment = .center
        titleLabel.accessibilityIdentifier = "label.title"
        
        /// contentStackView
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        
        /// tipBox
        tipBox.isHidden = true
        tipBox.backgroundColor = UIColor(rgb: 0xdcf2fc)
        tipBox.tipLabel.textColor = UIColor(rgb: 0x1d7632)
        tipBox.tipLabel.font = UIFont.systemFont(ofSize: 14)
        
        /// button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage.from(color: .brown), for: .normal)
        button.setBackgroundImage(UIImage.from(color: UIColor(rgb: 0xc2c2c2)), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.isHidden = true
        button.accessibilityIdentifier = "button.action"
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - Public Functions
extension TDetailBoxView {
    public func applyData(items: [TDetailItem],
                          title: String? = nil,
                          buttonTitle: String? = nil,
                          tipBoxTitle: String? = nil) {
        if let title = title {
            titleLabel.text = title
            titleLabel.isHidden = false
        }
        
        if let buttonTitle = buttonTitle {
            button.setTitle(buttonTitle, for: .normal)
            button.isHidden = false
        }
        
        if let tipBoxTitle = tipBoxTitle {
            tipBox.tipLabel.text = tipBoxTitle
            tipBox.isHidden = false
        }
        
        contentStackView.subviews.forEach(contentStackView.removeArrangedSubview(_:))
        
        for item in items {
            let itemTitleLabel = UILabel()
            itemTitleLabel.text = item.title
            itemTitleLabel.font = UIFont.systemFont(ofSize: 16)
            itemTitleLabel.textColor = UIColor(rgb: 0x333333)
            itemTitleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
            
            let itemValueLabel = UILabel()
            itemValueLabel.text = item.value
            itemValueLabel.font = UIFont.systemFont(ofSize: 16)
            itemValueLabel.textColor = UIColor(rgb: 0x333333)
            itemValueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            itemValueLabel.textAlignment = .right
            
            let itemStackView = UIStackView(arrangedSubviews: [
                itemTitleLabel,
                itemValueLabel
            ])
            
            itemStackView.axis = .horizontal
            itemStackView.distribution = .fill
            
            contentStackView.addArrangedSubview(itemStackView)
        }
    }
}

// MARK: - Other Extensions
private extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

private extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let bounds = CGRect(x: 0, y: 0, width: 1, height: 1)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { _ in
            color.setFill()
            UIRectFill(bounds)
        }
    }
}
