//
//  Book.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 27/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

class Book {
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}