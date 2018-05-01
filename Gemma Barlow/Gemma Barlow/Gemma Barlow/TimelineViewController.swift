//
//  TimelineViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

// MARK: - Data

private let data = [
    ["2017 -", "Engineering Manager (Mobile)", "Etsy", "Brooklyn, New York", "etsy", UIColor.paleBlueColor()],
    ["2014", "iOS Team Lead", "Harry's", "New York, New York", "harrys", UIColor.tealColor()],
    ["2013", "Mobile Team Lead", "Couchsurfing", "San Francisco, California", "couchsurfing", UIColor.paleBlueColor()],
    ["2011", "Senior iOS Developer", "Lonely Planet - BBC", "Oakland, California", "lonely-planet", UIColor.tealColor()],
    ["2009", "iOS Developer", "Intunity", "Melbourne, Victoria (Australia)", "westfield", UIColor.paleBlueColor()]
]

private enum TimelineIndex: Int {
    case year
    case job
    case title
    case location
    case image
    case color
}

struct TimelineItem {
    let year: String
    let title: String
    let job: String
    let location: String
    let image: UIImage?
    let color: UIColor
    
    init(year: String, title: String, job: String, location: String, imageName: String, color: UIColor) {
        self.year = year
        self.title = title
        self.job = job
        self.location = location
        self.image = UIImage(named: imageName)
        self.color = color
    }
}

private let timelineEstimatedCellHeight: CGFloat = 160.0


class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var timelineData: [TimelineItem] = {
        return data.map { dataItem in
            let year = dataItem[TimelineIndex.year.rawValue] as! String
            let job = dataItem[TimelineIndex.job.rawValue] as! String
            let title = dataItem[TimelineIndex.title.rawValue] as! String
            let location = dataItem[TimelineIndex.location.rawValue] as! String
            let imageName = dataItem[TimelineIndex.image.rawValue] as! String
            let color = dataItem[TimelineIndex.color.rawValue] as! UIColor
            
            return TimelineItem(year: year, title: title, job: job, location: location, imageName: imageName, color: color)
        }
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view?.backgroundColor = .backgroundGrayColor()
        setupTableView()
        registerCellsAndNibs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.flashScrollIndicators()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let empty = UITableViewCell()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TimelineTableViewCell.cellIdentifier, for: indexPath) as? TimelineTableViewCell else { return empty }
        cell.configure(with: timelineData[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.size.height - statusBarHeight() - navigationBarHeight()
        
        if floor(bottom) >= floor(scrollView.contentSize.height) {
            footerView.animate()
        }
    }
    
    
    // MARK: - Actions
    
    @objc func footerViewTapped(_ sender: UIView) {
        presentTimelineDetailsViewController()
    }
    
    
    private func presentTimelineDetailsViewController() {
        let storyboard = UIStoryboard(name: "MoreDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MoreDetailsViewController")
        present(viewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Other
    
    private func setupTableView() {
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .backgroundGrayColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = timelineEstimatedCellHeight
        tableView.tableFooterView = footerView
    }
    
    private func registerCellsAndNibs() {
        let nib = UINib(nibName: TimelineTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TimelineTableViewCell.cellIdentifier)
    }
    
    
    lazy var headerView: TimelineHeaderView = {
        let bundle = Bundle.main
        let finalView = bundle.loadNibNamed("TimelineHeaderView", owner: self, options: nil)?[0] as! TimelineHeaderView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TimelineViewController.headerViewTapped(_:)))
        finalView.addGestureRecognizer(tap)
        
        return finalView
    }()
    
    @objc func headerViewTapped(_ sender: UIView) {
        // GB - To be continued
    }
    
    lazy var footerView: TimelineFooterView = {
        let bundle = Bundle.main
        let finalView = bundle.loadNibNamed("TimelineFooterView", owner: self, options: nil)?[0] as! TimelineFooterView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TimelineViewController.footerViewTapped(_:)))
        finalView.addGestureRecognizer(tap)
        
        return finalView
    }()
}

