//
//  TDetailItem.swift
//  TDetailBoxView
//
//  Created by Nguyen, Thinh on 04/08/2022.
//

import Foundation

public struct TDetailItem: Equatable {
    let title: String
    let value: String
    
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
}
