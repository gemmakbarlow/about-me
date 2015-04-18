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
    
    
    // MARK: - Setup
    
    private func setupEmployerImageView() {
        employerImageView.layer.cornerRadius = 4.0
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
