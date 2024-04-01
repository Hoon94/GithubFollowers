//
//  GFRepoItemViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import UIKit

protocol GFRepoItemViewControllerDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemViewController: GFItemInfoViewController {
    weak var delegate: GFRepoItemViewControllerDelegate?
    
    init(user: User, delegate: GFRepoItemViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        leftItemInfoView.set(itemInfoType: .repos, withCount: user.publicRepos)
        rightItemInfoView.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "GitHub Profile", SFSymbol: SFSymbols.profile)
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGitHubProfile(for: user)
    }
}
