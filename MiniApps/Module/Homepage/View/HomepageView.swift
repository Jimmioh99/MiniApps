//
//  HomepageView.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import SnapKit

final class HomepageView: UIView {
    
    lazy var userTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(UserTableCell.self, forCellReuseIdentifier: String(describing: UserTableCell.self))
        return table
    }()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(userTable)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        userTable.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
