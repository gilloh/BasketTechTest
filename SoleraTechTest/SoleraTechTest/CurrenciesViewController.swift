//
//  CurrenciesViewController.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation

import UIKit

class CurrenciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables and Outlets

    var items: [String] = BasketManager.sharedInstance.currenciesData
    let reuseIdentifier = "CurrencyCell"
    let sharedBasket = BasketManager.sharedInstance

    @IBOutlet var tableView: UITableView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: Tableview Delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexStartOfCurrency = sharedBasket.currenciesRawData[indexPath.row].0.startIndex.advancedBy(3)
        sharedBasket.currentCurrency = sharedBasket.currenciesRawData[indexPath.row].0.substringFromIndex(indexStartOfCurrency)
        sharedBasket.currentRate = sharedBasket.currenciesRawData[indexPath.row].1
    }
}