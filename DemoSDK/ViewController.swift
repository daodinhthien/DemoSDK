//
//  ViewController.swift
//  DemoSDK
//
//  Created by ThienDD9 on 19/07/2024.
//

import UIKit
import CustomUISDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUI() {
        self.view.backgroundColor = .cyan
        self.title = CommonUtils.share.getEnvironmentType().tilte
        drawUI()
        
        let titleLabel = UILabel()
        titleLabel.text = CommonUtils.share.getEnvironmentType().tilte
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        let btn = CornerButton()
        btn.setTitle("Tiếp tục", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .green
        
        self.view.addSubview(btn)
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 40),
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            btn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        btn.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        let btn2 = CornerButton()
        btn2.backgroundColor = .blue
        btn2.setTitle("Show Test VC", for: .normal)
        btn2.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(btn2)
        
        NSLayoutConstraint.activate([
            btn2.heightAnchor.constraint(equalToConstant: 40),
            btn2.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -20),
            btn2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            btn2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        btn2.addTarget(self, action: #selector(showTestVC), for: .touchUpInside)
    }
    
    func showLoginView() async throws -> UIViewController {
        let vc = LoginViewController()
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().async {
                sleep(2)
                continuation.resume(returning: vc)
            }
        }
    }
    
    @objc func showAlert() {
        self.showLoading()
        Task {
            do {
                let vc = try await showLoginView()
                self.navigationController?.pushViewController(vc, animated: true)
                self.hideLoading()
            }
            catch {
                print("Lỗi khi tải dữ liệu: \(error)")
                hideLoading()
            }
        }
    }
    
    func gotoTestVC() async -> UIViewController {
        let vc = TestViewController()
        return await withCheckedContinuation { continuation in
            DispatchQueue.global().async {
                sleep(3)
                continuation.resume(returning: vc)
            }
        }
    }
    
    @objc func showTestVC() {
        showLoading()
        Task {
            let vc = await gotoTestVC()
            self.navigationController?.pushViewController(vc, animated: true)
            hideLoading()
        }
    }
    
    func drawUI() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let radius = (screenWidth / 2) - 20
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        path.move(to: CGPoint(x: 20, y: screenHeight / 2))
        path.addArc(withCenter: CGPoint(x: screenWidth / 2, y: screenHeight / 2), radius: radius, startAngle: Double.pi, endAngle: -Double.pi , clockwise: false)
        shapeLayer.path = path.cgPath
//        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 10
//        shapeLayer.cornerRadius = 200
        self.view.layer.addSublayer(shapeLayer)
        
        let colorFills = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.orange.cgColor, UIColor.brown.cgColor, UIColor.purple.cgColor]
        
        var startAngle = 0.0
        let endAngle = Double.pi/4
        for i in 1...8 {
            
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: screenWidth / 2, y: screenHeight / 2))
            path2.addArc(withCenter: CGPoint(x: screenWidth / 2, y: screenHeight / 2), radius: radius - 5, startAngle: startAngle, endAngle: endAngle * Double(i) , clockwise: true)
            path2.close()
            startAngle = endAngle * Double(i)
            
            let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = path2.cgPath
            shapeLayer2.fillColor = colorFills[i-1]
            shapeLayer2.strokeColor = UIColor.white.cgColor
            shapeLayer2.lineWidth = 2
//            shapeLayer2.cornerRadius = 5
            self.view.layer.addSublayer(shapeLayer2)
        }
    }
}

