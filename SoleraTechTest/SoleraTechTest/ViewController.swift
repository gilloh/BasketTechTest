//
//  ViewController.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import UIKit
import KRLCollectionViewGridLayout

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: Variables and Outlets
    
    var items = [Item]()
    var layout: KRLCollectionViewGridLayout {
        return self.collectionView?.collectionViewLayout as! KRLCollectionViewGridLayout
    }
    let reuseIdentifier = "ItemCell"
    let sharedBasket = BasketManager.sharedInstance
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Collection View Delegates
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomItemCell
        
        cell.imageView.image = items[indexPath.row].image
        cell.nameLabel.text = "\(items[indexPath.row].name): \(items[indexPath.row].price) per \(items[indexPath.row].description)"
        cell.amountLabel.text = "\(items[indexPath.row].amount)"
        
        cell.plusButton.addTarget(self, action: #selector(ViewController.plusButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.minusButton.addTarget(self, action: #selector(ViewController.minusButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    // MARK: Helper methods
    
    func setupData() {
        let peasItem = Item(id: 1, amount: 0, name: "Peas", price: 0.95, description: "bag", image: UIImage(named: "Peas"))
        let eggsItem = Item(id: 2, amount: 0, name: "Eggs", price: 2.10, description: "dozen", image: UIImage(named: "Eggs"))
        let milkItem = Item(id: 3, amount: 0,  name: "Milk", price: 1.30, description: "bottle", image: UIImage(named: "Milk"))
        let beansItem = Item(id: 4, amount: 0, name: "Beans", price: 0.73, description: "can", image: UIImage(named: "Beans"))
        
        items += [peasItem, eggsItem, milkItem, beansItem]
        
        sharedBasket.addProducts(items)
    }
    
    func setupLayout() {
        self.layout.numberOfItemsPerLine = 2
        self.layout.sectionInset = UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)
        self.layout.aspectRatio = 1.0
    }
    
    func plusButtonPressed(sender: UIButton!) {
        if let cell = sender.superview?.superview as? CustomItemCell {
            if let index = collectionView?.indexPathForCell(cell) {
                items[index.row].amount+=1
                collectionView.reloadData()
            }
        }
    }
    
    func minusButtonPressed(sender: UIButton!) {
        if let cell = sender.superview?.superview as? CustomItemCell {
            if let index = collectionView?.indexPathForCell(cell) {
                if items[index.row].amount != 0 {
                    items[index.row].amount-=1
                    collectionView.reloadData()
                }
            }
        }
    }

}

