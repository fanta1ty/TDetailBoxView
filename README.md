![LOGO](https://github.com/fanta1ty/TDetailBoxView/blob/master/ScreenShot/Logo.png)

# TDetailBoxView

 [![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen)](https://developer.apple.com/swift/)
[![Version](https://img.shields.io/cocoapods/v/TDetailBoxView.svg?style=flat)](https://cocoapods.org/pods/TDetailBoxView)
[![License](https://img.shields.io/cocoapods/l/TDetailBoxView.svg?style=flat)](https://cocoapods.org/pods/TDetailBoxView)
[![Email](https://img.shields.io/badge/contact-@thinhnguyen12389@gmail.com-blue)](thinhnguyen12389@gmail.com)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TDetailBoxView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TDetailBoxView'
```

## Usage
```swift
import TDetailBoxView
```

1) Initial ``TDetailBoxView`` 
```swift
let detailBoxView = TDetailBoxView()
```

2) Initial some items for displaying the detail content
```swift
items: [TDetailItem] = [
    TDetailItem(title: "Name:", value: "TDetailBoxView"),
    TDetailItem(title: "Author:", value: "fanta1ty"),
    TDetailItem(title: "Contact", value: "thinhnguyen12389@gmail.com"),
    TDetailItem(title: "Run:", value: "pod 'TDetailBoxView'")
]
```

3) Call function ``applyData`` to add items into ``TDetailBoxView``
```swift
contentView.detailBoxView.applyData(items: items,
                                    title: "TDetailBoxView",
                                    buttonTitle: "OK",
                                    tipBoxTitle: "Tip: Please use TDetailBoxView for displaying detail UI")
]
```


![til](https://github.com/fanta1ty/TDetailBoxView/blob/master/ScreenShot/demo.gif)

## Requirements
- iOS 10.0 or later
- Swift 5.0 or later

## Author

fanta1ty, thinhnguyen12389@gmail.com

## License

TDetailBoxView is available under the MIT license. See the LICENSE file for more info.
