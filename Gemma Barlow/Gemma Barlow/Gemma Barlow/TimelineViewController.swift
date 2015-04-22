//
//  TimelineViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let timelineData = [
    ["2014 -", "iOS Team Lead", "Harry's", "New York, New York", "harrys", UIColor.tealColor()],
    ["2013", "Mobile Team Lead", "Couchsurfing", "San Francisco, California", "couchsurfing", UIColor.palePinkColor()],
    ["2011", "Senior iOS Developer", "Lonely Planet - BBC", "Oakland, California", "lonely-planet", UIColor.mauveColor()],
    ["2009", "iOS Developer", "Intunity", "Melbourne, Victoria (Australia)", "westfield", UIColor.paleYellowColor()]
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        tableView.flashScrollIndicators()
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
        let job: String = data[1] as! String
        let title: String = data[2] as! String
        let location: String = data[3] as! String
        let imageName: String = data[4] as! String
        let color: UIColor = data[5] as! UIColor
        
        cell.configureCellWithEmployerData(year, job: job, title: title, location: location, imageName: imageName, color: color)
        
        return cell
    }
    
    
    // MARK: - UIScrollViewDelegate

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if bottom >= scrollView.contentSize.height {
            footerView.animate()
        }
    }
    
    // MARK: - Other
    
    private func setupTableView() {
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = UIColor.backgroundGrayColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = TimelineEstimatedCellHeight
        tableView.tableFooterView = footerView
    }
    
    private func registerCellsAndNibs() {
        let nib = UINib(nibName: TimelineTableViewCell.nibName, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: TimelineTableViewCell.cellIdentifier)
    }
    
    
    lazy var headerView: TimelineHeaderView = {
        let bundle = NSBundle.mainBundle()
        let finalView = bundle.loadNibNamed("TimelineHeaderView", owner: self, options: nil)[0] as! TimelineHeaderView
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("headerViewTapped:"))
        finalView.addGestureRecognizer(tap)
        
        return finalView
    }()
    
    func headerViewTapped(sender: UIView) {
        // GB - To be continued
    }
    
    lazy var footerView: TimelineFooterView = {
        let bundle = NSBundle.mainBundle()
        let finalView = bundle.loadNibNamed("TimelineFooterView", owner: self, options: nil)[0] as! TimelineFooterView
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("footerViewTapped:"))
        finalView.addGestureRecognizer(tap)
            
        return finalView
    }()
    
    
    func footerViewTapped(sender: UIView) {
        presentTimelineDetailsViewController()
    }
    
    
    private func presentTimelineDetailsViewController() {
        let storyboard = UIStoryboard(name: "TimelineDetail", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("TimelineDetailViewController") as! UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
}

