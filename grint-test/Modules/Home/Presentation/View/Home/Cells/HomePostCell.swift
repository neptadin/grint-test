//
//  HomePostCell.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit
import SDWebImage

final class HomePostCell: UITableViewCell, Reusable, ImageResizable {
    private enum Constants {
        static let horizontalPadding = 30.0
    }

    @IBOutlet var subredditLabel: UILabel!
    @IBOutlet var postInformationLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var upvotesLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!

    private var aspectRatioConstraint: NSLayoutConstraint?

    var onCellTap: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        let contentViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onCellTapped))
        contentViewGestureRecognizer.numberOfTapsRequired = 1
        contentView.addGestureRecognizer(contentViewGestureRecognizer)

        postImageView.layer.cornerRadius = 15.0
    }

    func setImage(imageUrl: String?, size: CGSize?) {
        guard let imageUrl, let size else {
            postImageView.isHidden = true
            return
        }

        if let aspectRatioConstraint {
            postImageView.removeConstraint(aspectRatioConstraint)
        }

        let aspectRatio = size.height / size.width
        aspectRatioConstraint = postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: aspectRatio)
        aspectRatioConstraint?.isActive = true

        postImageView.setImage(url: imageUrl)
        postImageView.isHidden = false
    }

    @objc func onCellTapped() {
        onCellTap?()
    }
}
