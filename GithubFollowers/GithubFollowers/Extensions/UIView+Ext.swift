//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/28.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
