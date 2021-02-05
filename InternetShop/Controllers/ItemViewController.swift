//
//  ItemViewController.swift
//  InternetShop
//
//  Created by Даир Алаев on 05.02.2021.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = item?.title
        self.descriptionLabel.text = item?.description
        self.priceLabel.text = "$" + String(format: "%.2f", item?.price ?? 0)
        self.imageLabel.image = UIImage(named: (item?.image!)!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: Any) {
        CartTableViewController.items.append(item!)
    }
    

}
