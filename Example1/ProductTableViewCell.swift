//
//  ProductTableViewCell.swift
//  Example1
//
//  Created by John Haselden on 13/01/2019.
//  Copyright © 2019 John Haselden. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var detailsLabel: UILabel?
    @IBOutlet weak var productImage: UIImageView?
    @IBOutlet weak var stockStatusImage: UIImageView?
    var task: URLSessionDataTask?
    
    var item: Item? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    private func configureView() {
        nameLabel?.text = item?.name
        detailsLabel?.text = item?.details
        
        // TODO: download the image

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let imageURL = item?.imageURL, let url = URL(string: imageURL) {
            let request = URLRequest(url: url)
        
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImage?.image = image
                    }
                }
            })
            task?.resume()
        }
        
        
        switch self.item?.stockLevel {
        case "low":
            self.stockStatusImage?.setImageColor(color: .red)
        default:
            self.stockStatusImage?.setImageColor(color: .green)
        }
    }

    override func prepareForReuse() {
        // Kill any downloads
        if let task = task {
            task.cancel()
        }
    }
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
