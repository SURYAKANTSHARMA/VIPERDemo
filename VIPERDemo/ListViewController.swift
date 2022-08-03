//
//  ListViewController.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import UIKit

 class ListViewController: UIViewController, ListView {
    var presenter: ListPresenterInterface?
    var items = [Item]()
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchItems()
        // Do any additional setup after loading the view.
    }


    func updateUI(_ items: [Item]) {
        self.items = items
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func showError(message: String) {
        print(message)
    }

}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableCell.self)) as? ListTableCell else {
            assertionFailure()
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.productNameLabel.text = item.title
        cell.productNameWeight.text = item.description
        cell.productNamePrice.text = String(item.price)
        cell.productNamePrice.contentMode = .scaleAspectFit
        
        cell.url = item.image
        if let url = item.image {
            presenter?.fetchImage(for: url, callback: { [weak cell] (result: Result<(UIImage, URL), Error>) in
                
                guard let cell = cell, let (image, url) = try? result.get() else { return }
                
                if cell.url == url {
                    cell.productImageView.image = image
                }
           })
        } else {
            // hide image
        }
        
        cell.layoutIfNeeded()
        return cell 
    }

}
