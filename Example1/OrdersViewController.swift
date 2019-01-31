//
//  OrdersViewController.swift
//  Example1
//
//  Created by John Haselden on 30/01/2019.
//  Copyright © 2019 John Haselden. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    
    var orders = [Order]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource: "items", ofType: "json") {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let payload = try decoder.decode(Payload.self, from: data)
                
                print ("\(payload)")
                
                orders = payload.orders
                
                self.tableView?.reloadData()
            } catch {
                // handle error
                print("error \(error)")
            }
        } else {
            print ("no path")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrdersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        
        if let orderCell = cell as? OrderTableViewCell {
            orderCell.order = orders[indexPath.row]
        }
        
        return cell
    }
}

extension OrdersViewController: UITableViewDelegate {
    
}
