//
//  LoginViewController.swift
//  CustomUISDK
//
//  Created by ThienDD9 on 19/07/2024.
//

import UIKit

public class LoginViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        makeBackItem()
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = .green
        self.title = "Login"
        
        let btn = CornerButton()
        btn.backgroundColor = .brown
        btn.setTitle("Tiếp tục", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 40),
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            btn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        btn.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
    }
    
    func makeBackItem() {
        let backItem = NavigationItemCommon.makeBarLeftIconItem(icon: "ic_back", target: self, action: #selector(onBack))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc func onBack() {
        guard let vcs = self.navigationController?.viewControllers else {
            self.navigationController?.dismiss(animated: true)
            return
        }
        if vcs.count <= 1 {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
  
    @objc func showAlert() {
        let alert = UIAlertController(title: "Thông báo", message: "Đây là thông báo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

class NavigationItemCommon {
    static func makeBarLeftIconItem(icon: String, target: Any, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.instance(named: icon), for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.contentHorizontalAlignment = .left
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
    static func makeBarRightIconItem(icon: String, target: Any, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.instance(named: icon), for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.contentHorizontalAlignment = .right
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
    static func makeBarLeftTextItem(title: String, target: Any, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(.black, for: .normal)
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
    static func makeBarRightTextItem(title: String, target: Any, color: UIColor = .black, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        btn.contentHorizontalAlignment = .right
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.setTitleColor(color, for: .normal)
        let item = UIBarButtonItem(customView: btn)
        return item
    }
    
    static func makeBarRightIconVPBankItem(icon: String, target: Any, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage.instance(named: icon), for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        let item = UIBarButtonItem(customView: btn)
        return item
    }
}

public extension UIImage {
    static func instance(named: String) -> UIImage? {
        let bundle = Bundle(identifier:"com.vn.CustomUISDK")
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
    
    static func instanceMain(named: String) -> UIImage? {
        let bundle = Bundle.main
        return UIImage(named: named, in: bundle, compatibleWith: nil)
    }
}
