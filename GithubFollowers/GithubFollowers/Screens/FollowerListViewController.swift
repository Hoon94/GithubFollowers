//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/23.
//

import UIKit

class FollowerListViewController: UIViewController {
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
