//
//  HomeDeliveryView.swift
//  AchouFood
//
//  Created by pablo henrique on 12/11/25.
//

import Foundation
import UIKit
import SnapKit

struct Constants {
    static let headerHeight = 36
    static let cornerRadius = 20.0
    
}

class HomeDeliveryView: UIView {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroudView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.gray100
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        addSubview(headerView)
        addSubview(backgroudView)
    }
    
    func setViewConstraints() {
        headerView.snp.makeConstraints{ make in
            make.height.equalTo(Constants.headerHeight)
            make.top.leading.trailing.equalToSuperview().inset(Metrics.medium)
        }
        
        backgroudView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(Metrics.medium)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setViewConfigs() {
        backgroundColor = Color.redDark
        backgroudView.layer.cornerRadius = Constants.cornerRadius
        backgroudView.layer.masksToBounds = true
        backgroudView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
