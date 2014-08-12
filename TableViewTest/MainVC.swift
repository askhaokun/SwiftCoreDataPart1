//
//  MainVC.swift
//  TableViewTest
//
//  Created by David Owens on 6/24/14.
//  Copyright (c) 2014 rhinoIO. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //This is your tableView
    @IBOutlet var table: UITableView!
    
    var items: [String] = ["Brazil", "USA", "Argentina", "Germany"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "World Cup Favs"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        table.reloadData()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! { let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TableView")
        
        //Assign the contents of our var "items" to the textLabel of each cell
        cell.textLabel.text = self.items[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        //Create instance of DetailVC
        var detail:DetailVC = self.storyboard.instantiateViewControllerWithIdentifier("DetailVC") as DetailVC
        
        //Reference DetailVC's var "cellName" and assign it to DetailVC's var "items"
        detail.cellName = self.items[indexPath.row]
        
        //Programmatically push to associated VC (DetailVC)
        self.navigationController.pushViewController(detail, animated: true)
    }

}
