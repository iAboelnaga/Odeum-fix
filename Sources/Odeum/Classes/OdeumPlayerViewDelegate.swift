//
//  OdeumPlayerViewDelegate.swift
//  Odeum
//
//  Created by Nayanda Haberty on 25/01/21.
//

import Foundation
#if canImport(UIKit)
import UIKit

public protocol OdeumPlayerViewDelegate: AnyObject {
    func odeumDidPlayVideo(_ player: OdeumPlayerView)
    func odeumDidPauseVideo(_ player: OdeumPlayerView)
    func odeumViewControllerToPresentFullScreen(_ player: OdeumPlayerView) -> UIViewController
    func odeumDidGoToFullScreen(_ player: OdeumPlayerView)
    func odeumDidDismissFullScreen(_ player: OdeumPlayerView)
    func odeumDidMuted(_ player: OdeumPlayerView)
    func odeumDidUnmuted(_ player: OdeumPlayerView)
    func odeum(_ player: OdeumPlayerView, forwardedBy interval: TimeInterval)
    func odeum(_ player: OdeumPlayerView, rewindedBy interval: TimeInterval)
    func odeumDidBuffering(_ player: OdeumPlayerView)
    func odeumDidFinishedBuffering(_ player: OdeumPlayerView)
    func odeum(_ player: OdeumPlayerView, progressingBy percent: Double)
}

public extension OdeumPlayerViewDelegate {
    func odeumDidPlayVideo(_ player: OdeumPlayerView) { }
    func odeumDidPauseVideo(_ player: OdeumPlayerView) { }
    func odeumViewControllerToPresentFullScreen(_ player: OdeumPlayerView) -> UIViewController {
        guard let viewController = player.viewController else {
            fatalError()
        }
        return viewController
    }
    func odeumDidGoToFullScreen(_ player: OdeumPlayerView) { }
    func odeumDidDismissFullScreen(_ player: OdeumPlayerView) { }
    func odeumDidMuted(_ player: OdeumPlayerView) { }
    func odeumDidUnmuted(_ player: OdeumPlayerView) { }
    func odeum(_ player: OdeumPlayerView, forwardedBy interval: TimeInterval) { }
    func odeum(_ player: OdeumPlayerView, rewindedBy interval: TimeInterval) { }
    func odeumDidBuffering(_ player: OdeumPlayerView) { }
    func odeumDidFinishedBuffering(_ player: OdeumPlayerView) { }
    func odeum(_ player: OdeumPlayerView, progressingBy percent: Double) { }
}
#endif
