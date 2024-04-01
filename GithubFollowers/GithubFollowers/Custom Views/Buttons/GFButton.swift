//
//  GFButton.swift
//  GithubFollowers
//
//  Created by Daehoon Lee on 2024/03/22.
//

import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, title: String, SFSymbol: UIImage?) {
        self.init(frame: .zero)
        set(color: color, title: title, SFSymbol: SFSymbol)
    }
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String, SFSymbol: UIImage?) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = SFSymbol
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
