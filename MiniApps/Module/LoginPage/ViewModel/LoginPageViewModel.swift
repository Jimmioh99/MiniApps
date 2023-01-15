//
//  LoginPageViewModel.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol LoginPageViewModelInput {
    func viewDidLoad()
    func postLogin(email: String, password: String)
}

protocol LoginPageViewModelOutput {
    func goToHomepage()
}

protocol LoginPageViewModel: LoginPageViewModelInput, LoginPageViewModelOutput {}

final class LoginPageViewModelImpl: LoginPageViewModel {
    
    weak var view: LoginPageViewController?
    
    init(view: LoginPageViewController?) {
        self.view = view
    }
    
    // MARK: - OUTPUT
    
    func goToHomepage() {
        let vc = HomepageViewController()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - INPUT

extension LoginPageViewModelImpl {
    func viewDidLoad() {
        
    }
    
    func postLogin(email: String, password: String) {
    
        guard let url = URL(string: Constants.baseUrl + "api/login") else { return }
        let params: [String: String] = [
            "email": email,
            "password": password
        ]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                self.goToHomepage()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
