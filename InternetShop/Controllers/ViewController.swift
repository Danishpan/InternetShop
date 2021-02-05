//
//  ViewController.swift
//  InternetShop
//
//  Created by Даир Алаев on 04.02.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var shopSC: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var arr = [Item]()
    let cellId = "ShopTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupShopItems()
        configureTableView()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }

    func setupShopItems(){
        arr.append(Item(title: "Nike Air Force 1 '07", description: "Men's Shoe", image: "image0", price: 90))
        arr.append(Item(title: "Nike Blazer Low '77 Vintage", description: "Men's Shoe", image: "image1", price: 85))
        arr.append(Item(title: "Nike Blazer Mid '77 Vintage", description: "Men's Shoe", image: "image2", price: 100))
        arr.append(Item(title: "Nike Air Max 97", description: "Men's Shoe", image: "image3", price: 170))
        arr.append(Item(title: "Nike Air Max 90", description: "Men's Shoe", image: "image4", price: 120))
        arr.append(Item(title: "Nike Air VaporMax Plus", description: "Men's Shoe", image: "image5", price: 200))
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopTableViewCell")
        tableView.tableFooterView = UIView()
        
    }
    
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ShopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShopCollectionViewCell")
        
    }
    
    @IBAction func stateChanged(_ sender: Any) {
        switch shopSC.selectedSegmentIndex
            {
            case 0:
                collectionView.isHidden = true
                tableView.isHidden = false
            case 1:
                collectionView.isHidden = false
                tableView.isHidden = true
            default:
                break
            }
    }
    
    @IBAction func openCart(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CartTableViewController") as! CartTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ShopTableViewCell
        let item = arr[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = "$" + String(format: "%.2f", item.price ?? 0)
        cell.itemImage.image = UIImage(named: item.image!)
        cell.item = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell", for: indexPath) as! ShopCollectionViewCell
        let item = arr[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.description
        cell.priceLabel.text = "$" + String(format: "%.2f", item.price ?? 0)
        cell.itemImage.image = UIImage(named: item.image!)
        cell.item = item
        
        if (cell.addButton.isSelected) {
            CartTableViewController.items.append(item)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "ItemViewController") as! ItemViewController
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)    }
    
    
    
}


