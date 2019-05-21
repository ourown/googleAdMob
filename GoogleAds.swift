//
//  GoogleAds.swift
//
//
//  Created by Ilesh's 2018 on 18/05/19.
//  Copyright © 2019 Ilesh. All rights reserved.
//

// 1st step
//AppDelegate.swift
/*
 
 import UIKit
 import GoogleMobileAds

 @UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

 GADMobileAds.sharedInstance().start(completionHandler: nil)
 return true
 
 }
 
 //2nd step
 
 class Viewcontroller: UIViewController {
 
        override func viewDidLoad() {
            super.viewDidLoad()
 
            GoogleAds.shard.showAds() // only call this method to show ads in the view controller
        }
 }
 
*/


import UIKit
import GoogleMobileAds

class GoogleAds: NSObject {
    static let shard : GoogleAds = GoogleAds()
    
    var interstitial: GADInterstitial!
    
    override init() {
        super.init()
    }
    
    func showAds(isForce:Bool = false) -> Void {
        if Global.kretriveUserData().IsAdsShow == "1" || isForce {
            interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
            interstitial.delegate = self
            let request = GADRequest()
            interstitial.load(request)
        }
    }
    
}

extension GoogleAds : GADInterstitialDelegate {
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
        if interstitial.isReady {
            interstitial.present(fromRootViewController: Global.appDelegate.window!.rootViewController!)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
}
