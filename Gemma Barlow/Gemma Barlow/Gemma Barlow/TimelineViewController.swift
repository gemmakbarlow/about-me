//
//  TimelineViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let timelineData = [
    ["2014 -", "Harry's", "harrys", UIColor.tealColor()],
    ["2013", "Couchsurfing", "couchsurfing", UIColor.oceanBlueColor()],
    ["2011", "Lonely Planet - BBC", "lonely-planet", UIColor.mauveColor()],
    ["2009", "Intunity", "westfield", UIColor.paleYellowColor()]
]

private let TimelineEstimatedCellHeight: CGFloat = 160.0


class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        registerCellsAndNibs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TimelineTableViewCell.cellIdentifier, forIndexPath: indexPath) as! TimelineTableViewCell

        let data = timelineData[indexPath.row]
        let year: String = data[0] as! String
        let title: String = data[1] as! String
        let imageName: String = data[2] as! String
        let color: UIColor = data[3] as! UIColor
        
        cell.configureCellWithEmployerData(year, title: title, imageName: imageName, color: color)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    // GB - TBD
    
    // MARK: - Other
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.grayColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = TimelineEstimatedCellHeight
    }
    
    private func registerCellsAndNibs() {
        let nib = UINib(nibName: TimelineTableViewCell.nibName, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: TimelineTableViewCell.cellIdentifier)
    }
    
    
}

