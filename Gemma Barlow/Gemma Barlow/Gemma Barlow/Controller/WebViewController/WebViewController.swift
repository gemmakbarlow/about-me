//
//  WebViewController.swift
//  Harry's
//
//  Created by Gemma Barlow on 10/2/14.
//  Copyright (c) 2014 Gemma Barlow. All rights reserved.
//

import UIKit
import Foundation
import WebKit

/**
*  NB - This file has been ported over quickly from the ios-prototypes project; further work needs to be done to complete it.
*/
class WebViewController: UIViewController, /*WKNavigationDelegate,*/ UIWebViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var closeButtonItem: UIBarButtonItem!
    
    private var titleView: UIView = UIView(frame: CGRectMake(0, 0, 40.0, 40.0))
    
    var urlToLoad: NSURL = NSURL(string: "http://www.harrys.com")!
    var showRefreshButton = false // TODO: GB - Return to this, consider whether it should be the default setting
    var showActivityIndicator = false // TODO: GB - Return to this, consider whether it should be the default setting

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.dataDetectorTypes = .None
        
        let request = NSURLRequest(URL: urlToLoad)
        webView.loadRequest(request)
        
        if showActivityIndicator {
            navigationItem.titleView = titleView
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        webView.scrollView.delegate = self

        if !showRefreshButton {
            navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        webView.scrollView.delegate = nil
    }
    
    
    // MARK: - Common Web View Actions

    func didStartLoad() {
        if showActivityIndicator {
            showHideActivityIndicator(true)
        }
    }
    
    
    func didStopLoad() {
        if showActivityIndicator {
            showHideActivityIndicator(false)
        }
    }
    
    
    func didFailLoadWithError(error: NSError) {
        println("Error Details: \(error.localizedDescription)")
        
        if showActivityIndicator {
            showHideActivityIndicator(false)
        }
        displayErrorAlert()
    }
    
    
    // MARK: WKNavigationDelegate
    
//    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation) {
//        didStartLoad()
//    }
//    
//    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation) {
//       didStopLoad()
//    }
//    
//    func webView(webView: WKwebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError!){
//        didFailLoadWithError(error)
//    }
    
    
    // MARK: UIWebViewDelegate
    
    func webViewDidStartLoad(webView: UIWebView) {
        didStartLoad()
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        didStopLoad()
    }
    
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        didFailLoadWithError(error)
    }
    

    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.x > -scrollView.frame.size.width) {
            scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y)
        }
    }
    
    
    // MARK: Other

    func showHideActivityIndicator(showIndicator:Bool) {
//        if(showIndicator) {
//            if let targetView = self.navigationItem.titleView? {
//                ActivityIndicatorView.showInView(targetView, explicitlyCenter: false)
//            }
//        }
//        else {
//            ActivityIndicatorView.hideFromAllViews()
//        }
//        UIApplication.sharedApplication().networkActivityIndicatorVisible = showIndicator
    }
    
    
    
    func displayErrorAlert() {
        let loadingErrorTitle = NSLocalizedString("Error Loading", comment: "Title displayed when an in-app webpage is attempted to be displayed, and fails.")
        let loadingErrorMessage = NSLocalizedString("The current view could not be loaded; please try again.", comment: "Message displayed when an in-app webpage is attempted to be displayed, and fails.")
        // GB - To be continued
    }
    
    
    func prepareForModalPresentation() {
        navigationItem.leftBarButtonItem = closeButtonItem
    }
    
    
    @IBAction func refreshTapped() {
        if !webView.loading {
            webView.reload()
        }
    }
    
    
    @IBAction func closeTapped() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // MARK: Factory methods
    
    class func createWebViewControllerWithRemoteURL(urlToLoad: String) -> WebViewController {
        let remoteURL : NSURL = NSURL(string: urlToLoad)!
        return createWebViewController(remoteURL)
    }
    
    
    class func createWebViewControllerWithLocalURL(urlToLoad: NSString) -> WebViewController {
        let escapedURLPath = urlToLoad.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        let localURL: NSURL = NSURL.fileURLWithPath(escapedURLPath, isDirectory: false)!
        let webViewController = createWebViewController(localURL)
        webViewController.showActivityIndicator = false
        webViewController.showRefreshButton = false
        
        return webViewController
    }
    
    
    private class func createWebViewController(urlToLoad: NSURL) -> WebViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let webViewController: WebViewController = storyboard.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
        webViewController.urlToLoad = urlToLoad
        
        return webViewController
    }
    
    
    // MARK: - Storyboard
    
    class var storyboardName: String {
        return "WebView"
    }
    
}
