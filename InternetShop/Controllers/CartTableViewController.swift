//
//  CartTableViewController.swift
//  InternetShop
//
//  Created by Даир Алаев on 05.02.2021.
//

import UIKit

class CartTableViewController: UITableViewController {
    static var items: [Item] = []
    
    @IBOutlet weak var buyButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopTableViewCell")
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction func buyClicked(_ sender: Any) {
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Buy", message: "*Imagine you bought all the items*", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartTableViewController.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as! ShopTableViewCell
        let item = CartTableViewController.items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = "$" + String(format: "%.2f", item.price ?? 0)
        cell.itemImage.image = UIImage(named: item.image!)
        cell.addButton.isHidden = true
        
        return cell
    }
}
