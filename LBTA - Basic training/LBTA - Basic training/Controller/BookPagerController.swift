//
//  BookPagerController.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 27/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController {
    
    override func viewDidLoad() {
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Book"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
    }
    
}
