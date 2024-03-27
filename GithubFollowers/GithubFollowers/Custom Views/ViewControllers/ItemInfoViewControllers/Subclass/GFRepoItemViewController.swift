//
//  GFRepoItemViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        leftItemInfoView.set(itemInfoType: .repos, withCount: user.publicRepos)
        rightItemInfoView.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
