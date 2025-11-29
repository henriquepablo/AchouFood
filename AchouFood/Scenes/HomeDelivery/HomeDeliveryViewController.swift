//
//  HomeDeliveryViewController.swift
//  AchouFood
//
//  Created by pablo henrique on 12/11/25.
//

import Foundation
import UIKit

class HomeDeliveryViewController: UIViewController {
    
    private var homeDeliveryView: HomeDeliveryView?
    
    override func loadView() {
        super.loadView()
        self.homeDeliveryView = HomeDeliveryView()
        self.view = self.homeDeliveryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
