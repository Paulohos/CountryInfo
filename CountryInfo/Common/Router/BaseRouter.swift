//
//  BaseRouter.swift
//  CountryInfo
//
//  Created by Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//

import UIKit

class BaseRouter {
    
    // MARK: Properties
    
    weak var viewController: UIViewController?
    
    
    // MARK: Init
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func onPop(animated: Bool) {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
    func onPopToRoot(animated: Bool) {
        self.viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func onDismiss(animated: Bool) {
        self.viewController?.dismiss(animated: animated, completion: nil)
    }
    
    func onDismissNavigation(animated: Bool) {
        self.viewController?.navigationController?.dismiss(animated: animated, completion: nil)
    }
    
    func pushModule(viewController : UIViewController, animated : Bool) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentModule(viewController : UIViewController, animated : Bool) {
        self.viewController?.navigationController?.present(viewController, animated: animated, completion: nil)
    }
    
}
