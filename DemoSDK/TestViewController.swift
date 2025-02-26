//
//  TestViewController.swift
//  DemoSDK
//
//  Created by ThienDD9 on 29/07/2024.
//

import UIKit
import CustomUISDK

class TestViewController: UIViewController {

    @IBOutlet weak var btnContinue: CornerButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setUI() {
        self.view.backgroundColor = .brown
        self.title = "Test"
        self.btnContinue.setTitle("Tiếp tục", for: .normal)
    }

}
