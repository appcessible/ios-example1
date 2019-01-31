//
//  OrderTableViewCell.swift
//  Example1
//
//  Created by John Haselden on 31/01/2019.
//  Copyright © 2019 John Haselden. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var orderStatusImage: UIImageView!
    @IBOutlet weak var orderDetailsStackView: UIStackView!
    
    
    var order: Order? {
        didSet {
            if let order = order {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                
                dateLabel.text = dateFormatter.string(from: order.orderDate)
            
                switch order.status {
                case "accepted":
                    self.orderStatusImage?.setImageColor(color: .green)
                default:
                    self.orderStatusImage?.setImageColor(color: .red)
                }

                for item in order.items {
                    let itemLabel = UILabel()
                    itemLabel.text = item.name
                    
                    self.orderDetailsStackView.addArrangedSubview(itemLabel)
                }
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        for view in orderDetailsStackView.arrangedSubviews {
            orderDetailsStackView.removeArrangedSubview(view)
        }
    }
}
