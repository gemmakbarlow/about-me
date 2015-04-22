//
//  TimelineDetailViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let timelineData = [
    "At the 2011 WWDC Bash, Michael Franti gave Gem his guitar pick. She has it framed in her bedroom.",
    "The only Valentine's Day present Gem has ever received was an app; it contained puzzles that when completed revealed cheesy love-cartoons. #developerdating",
    "Gem shares a name with the most badass character in Sons of Anarchy (and secretly loves it).",
    "Gemma has found three bugs in her iOS code whilst dreaming; her subconscious frightens her sometimes.",
    "Gemma is writing the Harry's App entirely in Swift.",
    "At her first WWDC, Gem queued for The Keynote just a few spots behind Johns Siracusa and Gruber.",
    "Gem couldn't apply for a ticket in 2014 as her little sis scheduled her wedding for June 08 *sigh*"
]

class TimelineDetailViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var randomFactTitleButton: UIButton!
    @IBOutlet weak var randomFactLabel: UILabel!
    @IBOutlet weak var madeWithLoveLabel: UILabel!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundGrayColor()
        
        setupCloseButton()
        setupRandomFactTitleLabel()
        setupRandomFactLabel()
        setupMadeWithLoveLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Setup
    
    private func setupCloseButton() {
        closeButton.setTitleColor(UIColor.tealColor(), forState: .Normal)
    }
    
    private func setupRandomFactTitleLabel() {
        randomFactTitleButton.setTitleColor(UIColor.tealColor(), forState: .Normal)
    }
    
    private func setupRandomFactLabel() {
        randomFactLabel.alpha = 0.0
        randomFactLabel.textColor = UIColor.whiteColor()
    }
    
    private func setupMadeWithLoveLabel() {
        madeWithLoveLabel.textColor = UIColor.skyBlueColor()
    }
    
    // MARK: - Action
    
    @IBAction func revealFactTapped(sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(timelineData.count)))
        randomFactLabel.text = timelineData[randomIndex]
        randomFactLabel.alpha = 0.0
        
        UIView.animateWithDuration(0.3, animations: {
            self.randomFactLabel.alpha = 1.0
        })
    }
    
    @IBAction func swipeDownOccurred() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func twitterTapped(sender: UIButton) {
        let twitterURL = NSURL(string: "http://www.twitter.com/gemmakbarlow")
        openURL(twitterURL)
    }
    
    @IBAction func linkedInTapped(sender: UIButton) {
        let linkedInURL = NSURL(string: "http://www.linkedin.com/in/gemmakbarlow")
        openURL(linkedInURL)
    }
    
    @IBAction func githubTapped(sender: UIButton) {
        let githubURL = NSURL(string: "http://github.com/gemmakbarlow")
        openURL(githubURL)
    }
    
    @IBAction func personalWebsiteTapped(sender: UIButton) {
        let personalSite = NSURL(string: "http://gemmakbarlow.com")
        openURL(personalSite)
    }
    
    private func openURL(url: NSURL?) {
        if let u = url {
            UIApplication.sharedApplication().openURL(u)
        }
    }
}
