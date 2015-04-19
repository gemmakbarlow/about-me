//
//  TimelineTableViewCell.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var timelineView: UIView!
    @IBOutlet weak var employerImageView: UIImageView!
    @IBOutlet weak var employerTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        locationLabel.textColor = UIColor.backgroundGrayColor()
    }
    
    
    // MARK: - Configuration
    
    func configureCellWithEmployerData(year: String, title: String, location: String, imageName: String, color: UIColor) {
        employerImageView.image = UIImage(named: imageName)
        employerImageView.layer.cornerRadius = 8.0
        employerImageView.clipsToBounds = true
        
        employerTitleLabel.text = title
        yearLabel.text = year
        contentView.backgroundColor = color
        
        locationLabel.text = location
        
        timelineView.backgroundColor = UIColor.backgroundGrayColor()
    }
    
    
    // MARK: - Other
    
    class var cellIdentifier: String {
        return classAsString
    }
    
    class var nibName: String {
        return classAsString
    }
    
    private class var classAsString: String {
       return NSStringFromClass(self).truncatePriorToChar(".")
    }

}
