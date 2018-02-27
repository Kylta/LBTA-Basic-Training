//
//  ViewController.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 26/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupBooks()
    }
    
    private func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "Text for the second page")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
        let book2 = Book(title: "Bill Gates: A biography", author: "Michael Becraft", pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book, book2]
        
        guard let books = self.books else { return }
        
        for book in books {
            print(book.title)
            for page in book.pages {
                print(page.text)
            }
        }
    }
    
}

