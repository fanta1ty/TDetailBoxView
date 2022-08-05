//
//  ViewController+ContentView.swift
//  TDetailBoxView_Example
//
//  Created by Nguyen, Thinh on 04/08/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TDetailBoxView

extension ViewController {
    final class ContentView: UIView {
        private lazy var stackView = UIStackView(arrangedSubviews: [
            detailBoxView
        ])
        
        let detailBoxView = TDetailBoxView()
        
        init() {
            super.init(frame: .zero)
            addSubviews()
            setupSubviews()
            setupLayout()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) { nil }
    }
}

extension ViewController.ContentView {
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func setupSubviews() {
        backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
