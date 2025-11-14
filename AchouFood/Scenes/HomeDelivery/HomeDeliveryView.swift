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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "AddressIcon"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var headerTitleAddressLabel: UILabel = {
         let view = UILabel()
         view.font = Typography.label2Xs
         view.textColor = Color.gray200
         view.text = "home.header.addressTitle".localized
         return view
     }()
     
    private lazy var headerAddressLabel: UILabel = {
        let view = UILabel()
        view.font = Typography.bodySm
        view.textColor = Color.gray200
        view.text = "Av. das Estrelas, 567 - Canela, RS"
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
        headerView.addSubview(headerIcon)
        headerView.addSubview(headerTitleAddressLabel)
        headerView.addSubview(headerAddressLabel)
    }
    
    func setViewConstraints() {
        headerView.snp.makeConstraints{ make in
            make.height.equalTo(Constants.headerHeight)
            make.leading.trailing.equalToSuperview().inset(Metrics.medium)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        backgroudView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(Metrics.medium)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        headerIcon.snp.makeConstraints { make in
            make.size.equalTo(36)
            make.centerY.equalTo(headerView.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        headerTitleAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(headerIcon.snp.top).offset(Metrics.little)
            make.leading.equalTo(headerIcon.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
        }
                
        headerAddressLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerIcon.snp.trailing).offset(12)
            make.top.equalTo(headerTitleAddressLabel.snp.bottom).offset(Metrics.nano)
            make.trailing.equalToSuperview()
        }
        

    }
    
    func setViewConfigs() {
        backgroundColor = Color.redDark
        backgroudView.layer.cornerRadius = Constants.cornerRadius
        backgroudView.layer.masksToBounds = true
        backgroudView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
