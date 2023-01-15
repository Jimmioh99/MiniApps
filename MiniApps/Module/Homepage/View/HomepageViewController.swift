//
//  HomepageViewController.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit

final class HomepageViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    private lazy var viewModel: HomepageViewModel = HomepageViewModelImpl(view: self)
    private lazy var root: HomepageView = HomepageView()
    
    var userArr: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setDelegate()
        
        viewModel.getUsers()
    }
    
    private func setDelegate() {
        root.userTable.delegate = self
        root.userTable.dataSource = self
    }
    
    func updateUser(users: [UserModel]) {
        self.userArr = users
        root.userTable.reloadData()
    }
}

extension HomepageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = userArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableCell.self), for: indexPath) as! UserTableCell
        cell.setupCell(user: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.width / 3)
    }
    
}
