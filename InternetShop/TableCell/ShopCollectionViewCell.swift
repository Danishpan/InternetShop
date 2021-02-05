//
//  ShopCollectionViewCell.swift
//  InternetShop
//
//  Created by Даир Алаев on 04.02.2021.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var item: Item?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addItem(_ sender: Any) {
        CartTableViewController.items.append(item!)
    }
}
