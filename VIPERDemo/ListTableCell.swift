//
//  ListTableCell.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import UIKit

class ListTableCell: UITableViewCell {
    var url: URL?
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productNameWeight: UILabel!
    @IBOutlet var productNamePrice: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
