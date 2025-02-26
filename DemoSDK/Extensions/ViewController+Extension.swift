//
//  Extension+ViewController.swift
//  DemoSDK
//
//  Created by ThienDD9 on 19/02/2025.
//

import UIKit

extension UIViewController {
    
    func showLoading() {
        LoadingIndicator.shared.show()
    }
    func hideLoading() {
        LoadingIndicator.shared.hide()
    }
}
