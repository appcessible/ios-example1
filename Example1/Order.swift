//
//  Order.swift
//  Example1
//
//  Created by John Haselden on 13/01/2019.
//  Copyright © 2019 John Haselden. All rights reserved.
//

import UIKit

class Order: Codable {
    var orderDate: Date
    var status: String
    var statusMessage: String
    var items: [Item]

}
