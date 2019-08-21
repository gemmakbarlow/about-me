//
//  TimelineTableViewCell.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let employerImageViewCornerRadius: CGFloat = 8.0

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
	
	func configure(with item: TimelineItem) {
		return configureCellWithEmployerData(year: item.year, job: item.job, title: item.title, location: item.location, image: item.image, color: item.color)
	}
	
    private func configureCellWithEmployerData(year: String, job: String, title: String, location: String, image: UIImage?, color: UIColor) {
        setupEmployerImage(image: image)
        setupTextLabels(title, year: year, location: location, job: job)
        
        backgroundColor = color
        timelineView.backgroundColor = .backgroundGrayColor()
    }
    
    // MARK: - Setup
    
    private func setupEmployerImage(image: UIImage?) {
        employerImageView.image = image
        employerImageView.layer.cornerRadius = employerImageViewCornerRadius
        employerImageView.clipsToBounds = true
    }
    
    private func setupTextLabels(_ title: String, year: String, location: String, job: String) {
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
       return NSStringFromClass(self).truncatePriorToAndIncludingChar(".")
    }

}
