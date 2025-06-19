//
//  HomePostCell.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit
import SDWebImage

final class HomePostCell: UITableViewCell {
    @IBOutlet var subredditLabel: UILabel!
    @IBOutlet var postInformationLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var postLink: UIButton!
    @IBOutlet var upvotesLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
}
