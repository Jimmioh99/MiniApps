//
//  LoginPageView.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import SnapKit

final class LoginPageView: UIView {
    
    let mainView = UIView()
    
    let loginTextLbl = UILabel()
    
    let mainStack = UIStackView()
    let emailTF = FormTextFieldView(title: "Email", placeholder: "Insert your email ...", type: .name)
    let passwordTF = FormTextFieldView(title: "Password", placeholder: "Insert your password ...", type: .password)
    let errorView: ErrorMessageView = ErrorMessageView()
    
    let loginBtn = CustomButton(title: "Login")
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(mainView)
        mainView.setupSubviews([loginTextLbl, mainStack, loginBtn])
        mainStack.setupArrangedSubviews(emailTF, passwordTF, errorView)
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        loginTextLbl.text = "Login"
    }
    
    func setupView() {
        loginTextLbl.font = UIFont.boldSystemFont(ofSize: 24)
        
        mainStack.axis = .vertical
        mainStack.spacing = 20
        
        errorView.isHidden = true
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        loginTextLbl.snp.makeConstraints { make in
            make.top.equalTo(mainView).offset(30)
            make.leading.equalTo(mainView).offset(30)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(loginTextLbl.snp.bottom).offset(60)
            make.leading.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(emailTF)
            make.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
