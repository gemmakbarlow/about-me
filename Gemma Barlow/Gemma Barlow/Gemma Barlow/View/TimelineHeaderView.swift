//
//  TimelineHeaderView.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

// MARK: - Animation Constants

private let SpringUpAnimationDelay: TimeInterval = 0.0
private let SpringUpAnimationDuration: TimeInterval = 1.0
private let SpringUpAnimationDampening: CGFloat = 0.7
private let SpringUpAnimationVelocity: CGFloat = 1.0


class TimelineHeaderView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imagePositionConstraint: NSLayoutConstraint!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .backgroundGrayColor()

        subtitleLabel.text = subtitleLabel.text?.uppercased()
        
        // GB - Animation!
        fadeInView(titleLabel) { [weak self] completed in
            if let strong = self, completed {
                strong.springUpView(strong.imagePositionConstraint) { [weak self] completed in
                    if let strong = self, completed {
                        self?.fadeInView(strong.subtitleLabel, completion: nil)
                    }
                }
            }
       }
    }
    
    
    // MARK: - Animation
    
    private func springUpView(_ view: NSLayoutConstraint, completion: ((Bool) -> Void)?) {
        imagePositionConstraint.constant = 0.0
        imageView.setNeedsUpdateConstraints()
        
        UIView.animate(withDuration: SpringUpAnimationDuration,
            delay: SpringUpAnimationDelay,
            usingSpringWithDamping: SpringUpAnimationDampening,
            initialSpringVelocity: SpringUpAnimationVelocity,
            options: .beginFromCurrentState,
            animations: { [weak self] in
                self?.imageView.layoutIfNeeded()
        }, completion: completion)
    }
}
