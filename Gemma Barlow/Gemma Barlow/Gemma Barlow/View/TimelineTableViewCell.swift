//
//  TimelineTableViewCell.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var employerImageView: UIImageView!
    @IBOutlet weak var employerTitleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - Configuration
    
    func configureCellWithEmployerData(year: String, title: String, imageName: String, color: UIColor) {
        employerImageView.image = UIImage(named: imageName)
         employerImageView.layer.cornerRadius = 10.0
        employerImageView.clipsToBounds = true
        
        employerTitleLabel.text = title
        yearLabel.text = year
        contentView.backgroundColor = color
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
