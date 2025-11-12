//
//  HomeDeliveryView.swift
//  AchouFood
//
//  Created by pablo henrique on 12/11/25.
//

import Foundation
import UIKit


class HomeDeliveryView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeDeliveryView: ViewCodeProtocol {
    
    func setViewHierarchy() {
        
    }
    
    func setViewConstraints() {
        
    }
    
    func setViewConfigs() {
        backgroundColor = Color.redDark
    }
}
