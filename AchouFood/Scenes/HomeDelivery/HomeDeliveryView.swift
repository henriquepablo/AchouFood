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
    static let headerHeight = 36.0
    static let cornerRadius = 20.0
    static let margin = 20.0
    static let addressIcon = "AddressIcon"
    static let addressTitle = "home.header.addressTitle"
    static let userAddressKey = "userAddress"
    static let iconSize = 36.0
    static let marginSize = 12.0
}

class HomeDeliveryView: UIView {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "AddressIcon")
        view.image = UIImage(named: Constants.addressIcon)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var headerTitleAddressLabel: UILabel = {
        let view = UILabel()
        view.font = Typography.label2Xs
        view.textColor = Color.gray200
        view.text = "home.header.addressTitle".localized
        view.text = Constants.addressTitle.localized
        return view
    }()
    
    private lazy var headerAddressLabel: UILabel = {
        let view = UILabel()
        view.font = Typography.bodySm
        view.textColor = Color.gray200
        view.text = StorageManage.shared.get(forkey: Constants.userAddressKey)
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = Color.gray100
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.gray100
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let search = UITextField()
        search.placeholder = "Busque por restaurantes"
        search.font = Typography.bodyMd
        search.textColor = Color.gray400
        search.backgroundColor = Color.grayTransparent20p
        search.layer.borderWidth = 1.5
        search.layer.borderColor = UIColor.white.cgColor
        let icon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        icon.tintColor = Color.gray400
        icon.contentMode = .scaleAspectFit
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        iconContainer.addSubview(icon)
        icon.frame = CGRect(x: 12, y: 0, width: 20, height: 20)
        search.leftView = iconContainer
        search.leftViewMode = .always
        search.clearButtonMode = .whileEditing
        search.delegate = self
        return search
    }()
    
    private lazy var listView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()


    override init(frame: CGRect = .zero) {
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(listView)
        contentView.addSubview(mapView)
        headerView.addSubview(headerIcon)
        headerView.addSubview(headerTitleAddressLabel)
        headerView.addSubview(headerAddressLabel)
    }

    func setViewConstraints() {
        headerView.snp.makeConstraints { make in
            make.height.equalTo(Constants.headerHeight)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(Metrics.medium)
            make.leading.trailing.equalToSuperview().inset(Constants.margin)
        }

        headerIcon.snp.makeConstraints { make in
            make.size.equalTo(36)
            make.size.equalTo(Constants.iconSize)
            make.centerY.equalTo(headerView.snp.centerY)
            make.leading.equalToSuperview()
        }

        headerTitleAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(headerIcon.snp.top).offset(Metrics.little)
            make.leading.equalTo(headerIcon.snp.trailing).offset(12)
            make.leading.equalTo(headerIcon.snp.trailing).offset(Constants.marginSize)
            make.trailing.equalToSuperview()
        }

        headerAddressLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerIcon.snp.trailing).offset(12)
            make.leading.equalTo(headerIcon.snp.trailing).offset(Constants.marginSize)
            make.top.equalTo(headerTitleAddressLabel.snp.bottom).offset(Metrics.nano)
            make.trailing.equalToSuperview()
        }

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(Metrics.medium)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{ make in
            make.edges.height.equalToSuperview()
           
        }
        
        listView.snp.makeConstraints{ make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(scrollView)
        }
        
        mapView.snp.makeConstraints{ make in
            make.leading.equalTo(listView.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }

    func setViewConfigs() {
        backgroundColor = Color.redDark
        scrollView.layer.cornerRadius = Constants.cornerRadius
        scrollView.layer.masksToBounds = true
        scrollView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension HomeDeliveryView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
