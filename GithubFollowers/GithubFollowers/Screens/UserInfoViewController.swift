//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/26.
//

import UIKit

class UserInfoViewController: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        print(username!)
    }
    
    @objc
    private func dismissViewController() {
        dismiss(animated: true)
    }
}