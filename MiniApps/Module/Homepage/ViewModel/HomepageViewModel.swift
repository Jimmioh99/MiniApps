//
//  HomepageViewModel.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol HomepageViewModelInput {
    func viewDidLoad()
    func getUsers()
}

protocol HomepageViewModel: HomepageViewModelInput {}

final class HomepageViewModelImpl: HomepageViewModel {
    
    weak var view: HomepageViewController?
    
    init(view: HomepageViewController?) {
        self.view = view
    }
    
    // MARK: - INPUT
    
    func viewDidLoad() {
        
    }
    
    func getUsers() {
        guard let url = URL(string: Constants.baseUrl + "api/users") else { return }
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):

                let json = JSON(value)
                let arrData = json["data"].arrayValue.map { data in
                    UserModel(json: data)
                }
                print(arrData)
                print(json)
                self.view?.updateUser(users: arrData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
