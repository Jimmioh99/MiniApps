//
//  LoginPageViewController.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginPageViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    private lazy var viewModel: LoginPageViewModel = LoginPageViewModelImpl(view: self)
    private lazy var root: LoginPageView = LoginPageView()
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        root.emailTF.formTF.text = ""
        root.passwordTF.formTF.text = ""
    }
    
    private func setupView() {
        root.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let email = self?.root.emailTF.formTF.text else { return }
            guard let password = self?.root.passwordTF.formTF.text else { return }
            self?.viewModel.postLogin(email: email, password: password)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}
