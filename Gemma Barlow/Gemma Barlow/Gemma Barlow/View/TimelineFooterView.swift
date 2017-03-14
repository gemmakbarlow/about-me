//
//  TimelineFooterView.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let TextAnimationDelay: TimeInterval = 0.3

class TimelineFooterView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subtitleLabel.text = subtitleLabel.text?.uppercased()
        backgroundColor = .backgroundGrayColor()
    }
    
    
    // MARK: - Animation
    
    func animate() {
        guard imageView.alpha == 0 else { return }

        fadeInView(titleLabel){ completed in
            guard completed else { return }

            self.fadeInView(self.imageView) { completed in
                if completed {
                    self.fadeInView(self.subtitleLabel, completion: nil)
                }
            }
        }

    }

}
