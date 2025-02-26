//
//  LoadingIndicator.swift
//  DemoSDK
//
//  Created by ThienDD9 on 19/02/2025.
//

import UIKit

class LoadingIndicator {

    // Tạo một instance duy nhất của LoadingIndicator
    static let shared = LoadingIndicator()

    // Loading view
    private var loadingView: UIView?

    // Tạo một UIActivityIndicatorView
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    // Tạo UIView chứa ActivityIndicator và Text
    private init() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        loadingView?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        activityIndicator.center = CGPoint(x: loadingView!.frame.size.width / 2, y: loadingView!.frame.size.height / 2)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        loadingView!.addSubview(activityIndicator)
        
        // Tạo một UILabel để hiển thị văn bản loading (tùy chọn)
        let label = UILabel(frame: CGRect(x: 0, y: loadingView!.frame.size.height / 2 + activityIndicator.frame.size.height/2 , width: loadingView!.frame.size.width, height: 30))
        label.text = "Đang tải..."
        label.textAlignment = .center
        label.textColor = .white
        loadingView?.addSubview(label)
    }
    
    // Hàm để hiển thị loading indicator
    func show() {
        guard let window = getWindow() else { return }
        window.addSubview(loadingView!)
        loadingView?.isHidden = false
    }
    
    // Hàm để ẩn loading indicator
    func hide() {
        loadingView?.isHidden = true
        loadingView?.removeFromSuperview()
    }
    
    func getWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene {
                return windowScene.windows.first(where: { $0.isKeyWindow })
            }
        }
        else {
            return UIApplication.shared.keyWindow
        }
        return nil
    }
}
