//
//  StorageManage.swift
//  AchouFood
//
//  Created by pablo henrique on 14/11/25.
//

import Foundation

final class StorageManage {
    
    static let shared = StorageManage()
    
    private init() {}
    
    func save<T>(value: T, forkey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func get<T>(forkey key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
}
