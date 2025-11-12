//
//  DeliveryScenesCoordinator.swift
//  AchouFood
//
//  Created by pablo henrique on 12/11/25.
//

import Foundation
import UIKit

class DeliveryScenesCoordinator {
    
    private var navigationController: UINavigationController?
    
    func start() -> UINavigationController? {
        self.navigationController = UIImagePickerController(rootViewController: HomeDeliveryViewController())
        
        return self.navigationController
    }
    
    
    
}
