//
//  TimelineViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TimelineTableViewCell.cellIdentifier, forIndexPath: indexPath)
        
        return cell as! UITableViewCell
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

