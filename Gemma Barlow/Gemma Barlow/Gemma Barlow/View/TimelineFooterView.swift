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
        backgroundColor = UIColor.backgroundGrayColor()
    }
    
    
    // MARK: - Animation
    
    func animate() {
        if imageView.alpha == 0 {
            fadeInView(imageView, completion: { (completed: Bool) -> Void in
                if completed && self.titleLabel.alpha == 0 {
                    self.fadeInView(self.titleLabel, delay: TextAnimationDelay,  completion: nil)
                     self.fadeInView(self.subtitleLabel, delay: TextAnimationDelay,  completion: nil)
                }
            })
        }
    }
    
}
