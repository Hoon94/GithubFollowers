//
//  FollowerCollectionViewCell.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/24.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = UIImageView()
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
}
