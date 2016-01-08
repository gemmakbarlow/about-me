//
//  TimelineTableViewCell.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let EmployerImageViewCornerRadius: CGFloat = 8.0

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var timelineView: UIView!
    @IBOutlet weak var employerImageView: UIImageView!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var employerTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationLabel.textColor = .backgroundGrayColor()
    }
    
    
    // MARK: - Configuration
    
    func configureCellWithEmployerData(year: String, job: String, title: String, location: String, imageName: String, color: UIColor) {
        setupEmployerImageView(imageName)
        setupTextLabels(title, year: year, location: location, job: job)
        
        contentView.backgroundColor = color
        timelineView.backgroundColor = .backgroundGrayColor()
    }
    
    // MARK: - Setup
    
    private func setupEmployerImageView(imageName: String) {
        employerImageView.image = UIImage(named: imageName)
        employerImageView.layer.cornerRadius = EmployerImageViewCornerRadius
        employerImageView.clipsToBounds = true
    }
    
    private func setupTextLabels(title: String, year: String, location: String, job: String) {
        jobLabel.text = job
        employerTitleLabel.text = title
        yearLabel.text = year
        locationLabel.text = location
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
