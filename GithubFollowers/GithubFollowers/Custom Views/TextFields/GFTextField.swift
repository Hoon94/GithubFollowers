//
//  GFTextField.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/22.
//

import UIKit

class GFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = .preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        autocorrectionType = .no
        placeholder = "Enter a username"
        keyboardType = .default
        returnKeyType = .go
        clearButtonMode = .whileEditing
        backgroundColor = .tertiarySystemBackground
    }
}
