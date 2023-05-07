//
//  NewsTableViewCell.swift
//  SpaceNews
//
//  Created by Muhammad Fikri Bill Gufran on 7/5/23.
//

import UIKit

protocol NewsTableViewCellDelegate: AnyObject {
    func visitButtonTapped(_ cell: UITableViewCell)
}

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var visitButton: UIButton!
    
    weak var delegate: NewsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let yPadding: CGFloat = 10
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(
//            top: yPadding,
//            left: 0,
//            bottom: 0,
//            right: 0
//        ))
//    }
    
    func setup() {
        setImageStyles()
        setButtonStyles()
    }
    
    func setImageStyles() {
        thumbnailImage.layer.cornerRadius = 10
        thumbnailImage.layer.masksToBounds = true
    }
    
    func setButtonStyles() {
        visitButton.layer.cornerRadius = 6
        visitButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func visitButtonTapped(_ sender: Any) {
        delegate?.visitButtonTapped(self)
    }
}
