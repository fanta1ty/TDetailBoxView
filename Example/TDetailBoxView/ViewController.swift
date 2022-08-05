//
//  ViewController.swift
//  TDetailBoxView
//
//  Created by thinhnguyen12389 on 08/04/2022.
//  Copyright (c) 2022 thinhnguyen12389. All rights reserved.
//

import UIKit
import TDetailBoxView

class ViewController: UIViewController {
    private lazy var contentView = ContentView()
    
    private let items: [TDetailItem] = [
        TDetailItem(title: "Name:", value: "TDetailBoxView"),
        TDetailItem(title: "Author:", value: "fanta1ty"),
        TDetailItem(title: "Contact", value: "thinhnguyen12389@gmail.com"),
        TDetailItem(title: "Run:", value: "pod 'TDetailBoxView'")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.detailBoxView.applyData(items: items,
                                            title: "TDetailBoxView",
                                            buttonTitle: "OK",
                                            tipBoxTitle: "Tip: Please use TDetailBoxView for displaying detail UI")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func loadView() {
        view = contentView
    }
}


