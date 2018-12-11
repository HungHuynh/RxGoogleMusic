//
//  ReplaceWindowControllerAnimator.swift
//  MacApp
//
//  Created by Anton Efimenko on 11/12/2018.
//  Copyright © 2018 Anton Efimenko. All rights reserved.
//

import Cocoa

class ReplaceWindowControllerAnimator: NSObject, NSViewControllerPresentationAnimator {
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        if let window = fromViewController.view.window {
            NSAnimationContext.runAnimationGroup({ _ in
                fromViewController.view.animator().alphaValue = 0
            }, completionHandler: {
                viewController.view.alphaValue = 0
                window.contentViewController = viewController
                viewController.view.animator().alphaValue = 1.0
            })
        }
    }
    
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        if let window = viewController.view.window {
            NSAnimationContext.runAnimationGroup({ _ in
                viewController.view.animator().alphaValue = 0
            }, completionHandler: {
                fromViewController.view.alphaValue = 0
                window.contentViewController = fromViewController
                fromViewController.view.animator().alphaValue = 1.0
            })
        }
    }
}
