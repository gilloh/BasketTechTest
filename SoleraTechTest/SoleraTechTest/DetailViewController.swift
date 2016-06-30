//
//  DetailViewController.swift
//  SoleraTechTest
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables and Outlets
    
    var items = [Item]()
    let reuseIdentifier = "BasketCell"
    let sharedBasket = BasketManager.sharedInstance
    private let url = "http://apilayer.net/api/live"
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        processCurrenciesRequest()
        
        for item in sharedBasket.items {
            if item.amount != 0 {
                items.append(item)
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Tableview Delegates/Datasources
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = "\(items[indexPath.row].name) x \(items[indexPath.row].amount)"
        cell.detailTextLabel?.text = "\(Double(round(100*items[indexPath.row].totalItemPrice * sharedBasket.currentRate)/100))"
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Items Selected:"
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "TOTAL AMOUNT: \(Double(round(100*sharedBasket.totalAmount)/100)) \(sharedBasket.currentCurrency)"
    }
    
    // MARK: Service Manager to process the list of currencies
    
    func processCurrenciesRequest() {
        var serviceManager:ServiceManager
        serviceManager = ServiceManager()
        let request:CurrencyRequest = CurrencyRequest(withBaseUrl: url)
        let parser:JSONParser = JSONParser()
        
        serviceManager.process(request, parser: parser) { (retVal) -> Void in
            if let resp = retVal as! CurrencyResponse? {
                self.sharedBasket.currenciesRawData = resp.collection[0].sortedCurrencies
            } else {
                self.sharedBasket.currenciesRawData.append(("USDUSD", 1.0))
            }
            
        }
    }
    
}