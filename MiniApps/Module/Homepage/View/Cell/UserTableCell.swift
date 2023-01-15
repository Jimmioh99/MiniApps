//
//  UserTableCell.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import SnapKit
import Kingfisher

final class UserTableCell: UITableViewCell {
    
    private lazy var iconImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var nameView: UIView = UIView()
    
    private lazy var nameLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var emailLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(user: UserModel) {
        if let url = URL(string: user.avatar) {
            iconImg.kf.setImage(with: url)
        }
        nameLbl.text = user.firstName + user.lastName
        emailLbl.text = user.email
    }
    
    private func setupConstraints() {
        
        contentView.setupSubviews([iconImg, nameView])
        nameView.setupSubviews([nameLbl, emailLbl])
        
        iconImg.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
            make.width.height.equalTo(UIScreen.main.bounds.width / 3)
        }
        
        nameView.snp.makeConstraints { make in
            make.leading.equalTo(iconImg.snp.trailing).offset(10)
            make.centerY.equalTo(iconImg)
            make.trailing.equalTo(contentView).offset(-10)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(nameView)
        }
        
        emailLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(nameView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
