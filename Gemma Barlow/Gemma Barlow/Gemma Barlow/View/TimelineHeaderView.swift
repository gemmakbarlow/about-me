//
//  TimelineHeaderView.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

// MARK: - Animation Constants

private let SpringUpAnimationDelay: NSTimeInterval = 0.0
private let SpringUpAnimationDuration: NSTimeInterval = 1.0
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
        backgroundColor = UIColor.backgroundGrayColor()

        subtitleLabel.text = subtitleLabel.text?.uppercaseString
        
        // GB - Animation!
        fadeInView(titleLabel, completion: { (completed: Bool) -> Void in
            if completed {
                self.springUpView(self.imagePositionConstraint, completion: { (completed: Bool) -> Void in
                    if completed {
                        self.fadeInView(self.subtitleLabel, completion: nil)
                    }
                })
            }
       })
    }
    
    
    // MARK: - Animation
    
    private func springUpView(view: NSLayoutConstraint, completion: ((Bool) -> Void)?) {
        imagePositionConstraint.constant = 0.0
        imageView.setNeedsUpdateConstraints()
        
        UIView.animateWithDuration(SpringUpAnimationDuration, delay: SpringUpAnimationDelay, usingSpringWithDamping: SpringUpAnimationDampening, initialSpringVelocity: SpringUpAnimationVelocity, options: .BeginFromCurrentState, animations: {
            self.imageView.layoutIfNeeded()
        }, completion: completion)
    }
}
