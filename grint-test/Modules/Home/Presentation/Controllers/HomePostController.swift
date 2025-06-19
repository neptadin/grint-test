//
//  HomePostController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit

final class HomePostController {
    private let viewModel: HomePostViewModel

    init(
        viewModel: HomePostViewModel
    ) {
        self.viewModel = viewModel
    }

    func view(in tableView: UITableView) -> UITableViewCell {
        let cell: HomePostCell = tableView.dequeueReusableCell(for: HomePostCell.self)
        binded(cell)
        return cell
    }

    private func binded(_ cell: HomePostCell) {
        cell.onCellTap = { [weak self] in
            guard let self else { return }
            viewModel.onCellTap(viewModel.detailLink)
        }

        cell.subredditLabel.text = viewModel.subreddit
        cell.postInformationLabel.text = viewModel.postInformation
        cell.titleLabel.text = viewModel.postTitle
        cell.upvotesLabel.text = viewModel.upvotes
        cell.commentsLabel.text = viewModel.comments
        cell.setImage(imageUrl: viewModel.thumbnail, size: viewModel.size)

        cell.layoutIfNeeded()
    }
}
