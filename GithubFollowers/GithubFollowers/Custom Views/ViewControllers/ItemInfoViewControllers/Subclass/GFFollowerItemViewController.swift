//
//  GFFollowerItemViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        leftItemInfoView.set(itemInfoType: .followers, withCount: user.followers)
        rightItemInfoView.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers()
    }
}
