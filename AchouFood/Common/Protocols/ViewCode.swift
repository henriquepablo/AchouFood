//
//  ViewCode.swift
//  AchouFood
//
//  Created by pablo henrique on 11/11/25.
//

import Foundation

public protocol ViewCodeProtocol {
    func setViewHierarchy()
    func setViewConstraints()
    func setViewConfigs()
    func buildLayout()
}

public extension ViewCodeProtocol {
    
    func buildLayout() {
        setViewHierarchy()
        setViewConstraints()
        setViewConfigs()
    }
    
    func setViewConfigs() {
        /* Empty intentionally */
    }
}
