//
//  GFFollowerItemViewController.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/27.
//

import UIKit

protocol GFFollowerItemViewControllerDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemViewController: GFItemInfoViewController {
    weak var delegate: GFFollowerItemViewControllerDelegate?
    
    init(user: User, delegate: GFFollowerItemViewControllerDelegate) {
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
        leftItemInfoView.set(itemInfoType: .followers, withCount: user.followers)
        rightItemInfoView.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", SFSymbol: SFSymbols.search)
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGetFollowers(for: user)
    }
}
