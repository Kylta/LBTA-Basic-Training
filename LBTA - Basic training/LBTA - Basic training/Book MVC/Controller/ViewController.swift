//
//  ViewController.swift
//  LBTA - Basic training
//
//  Created by Christophe Bugnon on 26/02/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarStyles()
        setupNavBarButton()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.title = "Kindle"
       /*
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true*/
        
        fetchBooks()
    }
    
    func setupNavigationBarStyles() {
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        
        let textAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func setupNavBarButton() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPress))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonPress))
        
    }
    
    @objc func handleMenuPress() {
        print("Menu pressed")
    }
    
    @objc func handleAmazonPress() {
        print("Icon pressed")
    }
    
    func fetchBooks() {
        print("Fetching books...")
        
        guard let url = URL(string: "Https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print("Failed to fetch external json books: ", err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                guard let bookDictionaries = json as? [[String:Any]] else { return }
                
                self.books = []
                for bookDictionary in bookDictionaries {
                    
                    let book = Book(dictionary: bookDictionary)
                    self.books?.append(book)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonError {
                print("Failed to parse JSON properly :", jsonError)
            }
            
            }.resume()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        
        bookPagerController.book = selectedBook
        
        let navController = UINavigationController(rootViewController: bookPagerController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = books?.count else { return 0 }
        
        return count
    }
}



