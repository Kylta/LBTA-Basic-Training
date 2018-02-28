//
//  PageCell.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 28/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT WILL COME HERE"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
