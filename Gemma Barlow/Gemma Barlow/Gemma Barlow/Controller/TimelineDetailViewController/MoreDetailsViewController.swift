//
//  MoreDetailsViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

// GB - normally I'd pop this stuff in Core Data, but it felt like overkill for this app.

private let randomFactData = [
    "At the 2011 WWDC Bash, Michael Franti gave Gem his guitar pick. She has it framed in her bedroom.",
    "The only Valentine's Day present Gem has ever received was an app; it contained puzzles that when completed revealed cheesy love-cartoons. #developerdating",
    "Gem shares a name with the most badass character in Sons of Anarchy (and secretly loves it).",
    "Gemma has found three bugs in her iOS code whilst dreaming; her subconscious frightens her sometimes.",
    "Gemma is writing the Harry's App entirely in Swift.",
    "At her first WWDC, Gem queued for The Keynote just a few spots behind Johns Siracusa and Gruber.",
    "Gem couldn't apply for a ticket in 2014 as her little sis scheduled her wedding for June 08 *sigh*"
]

private let TwitterProfile = "http://www.twitter.com/gemmakbarlow"
private let LinkedInProfile = "http://www.linkedin.com/in/gemmakbarlow"
private let GithubProfile = "http://github.com/gemmakbarlow"
private let PersonalSite = "http://gemmakbarlow.com"

private let RevealFactAnimationDuration = 0.3

class MoreDetailsViewController: UIViewController {

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
        randomFactLabel.alpha = HideViewAlpha
        randomFactLabel.textColor = UIColor.whiteColor()
    }
    
    private func setupMadeWithLoveLabel() {
        madeWithLoveLabel.textColor = UIColor.skyBlueColor()
    }
    
    // MARK: - Action
    
    @IBAction func revealFactTapped(sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(randomFactData.count)))
        randomFactLabel.text = randomFactData[randomIndex]
        randomFactLabel.alpha = HideViewAlpha
        
        UIView.animateWithDuration(RevealFactAnimationDuration) { [weak self] in
            self?.randomFactLabel.alpha = ShowViewAlpha
        }
    }
    
    @IBAction func swipeDownOccurred() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func twitterTapped(sender: UIButton) {
        let twitterURL = NSURL(string: TwitterProfile)
        openURL(twitterURL)
    }
    
    @IBAction func linkedInTapped(sender: UIButton) {
        let linkedInURL = NSURL(string: LinkedInProfile)
        openURL(linkedInURL)
    }
    
    @IBAction func githubTapped(sender: UIButton) {
        let githubURL = NSURL(string: GithubProfile)
        openURL(githubURL)
    }
    
    @IBAction func personalWebsiteTapped(sender: UIButton) {
        let personalSite = NSURL(string: PersonalSite)
        openURL(personalSite)
    }
    
    private func openURL(url: NSURL?) {
        if let u = url {
            UIApplication.sharedApplication().openURL(u)
        }
    }
}
