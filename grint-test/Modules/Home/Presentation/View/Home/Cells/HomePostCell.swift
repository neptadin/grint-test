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
    @IBOutlet var upvotesContainer: UIView!
    @IBOutlet var upvotesLabel: UILabel!
    @IBOutlet var commentsContainer: UIView!
    @IBOutlet var commentsLabel: UILabel!

    private var aspectRatioConstraint: NSLayoutConstraint?

    var onCellTap: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        let contentViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onCellTapped))
        contentViewGestureRecognizer.numberOfTapsRequired = 1
        contentView.addGestureRecognizer(contentViewGestureRecognizer)

        postImageView.layer.cornerRadius = 15.0

        [upvotesContainer, commentsContainer].forEach {
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor.white.cgColor
            $0.layer.cornerRadius = $0.layer.bounds.height / 2.0
        }
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
