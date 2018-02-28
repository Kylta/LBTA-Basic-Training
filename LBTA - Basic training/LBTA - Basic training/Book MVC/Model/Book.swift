//
//  Book.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 27/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation
import UIKit

class Book {
    let title: String
    let author: String
    let image: UIImage
    let pages: [Page]
    let coverImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.image = #imageLiteral(resourceName: "steve_jobs")
        self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
        
        var bookPages = [Page]()
        
        if let pagesDictionaries = dictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pagesDictionaries {
                if let pageText = pageDictionary["text"] as? String, let numPage = pageDictionary["id"] as? Int {
                    let page = Page(number: numPage, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        
        pages = bookPages
    }
}
