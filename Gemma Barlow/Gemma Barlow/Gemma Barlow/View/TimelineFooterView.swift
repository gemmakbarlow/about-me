//
//  TimelineFooterView.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let TextAnimationDelay: NSTimeInterval = 0.3

class TimelineFooterView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subtitleLabel.text = subtitleLabel.text?.uppercaseString
        backgroundColor = .backgroundGrayColor()
    }
    
    
    // MARK: - Animation
    
    func animate() {
        if imageView.alpha == 0 {
            fadeInView(titleLabel){ [weak self] completed in
                if let strong = self where completed {
                    strong.fadeInView(strong.imageView) { completed in
                        if let strong = self where completed {
                            strong.fadeInView(strong.subtitleLabel, completion: nil)
                        }
                    }
                }
            }
        }
    }
    
}
