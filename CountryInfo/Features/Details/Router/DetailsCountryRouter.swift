//
//  DetailsCountryRouter.swift
//  CountryInfo
//
//  Created Paulo Henrique Oliveira Souza on 24/06/2018.
//  Copyright © 2018 Paulo. All rights reserved.
//
//  Template generated by Paulo Henrique Oliviera Souza @-Lelouch
//

import UIKit

class DetailsCountryRouter: BaseRouter {
    
    static func makeController(parameter: ParameterIO) -> DetailsCountryViewController {
        
        let storyBoad = UIStoryboard(name: "MainInterface", bundle: nil)
        let view = storyBoad.instantiateViewController(withIdentifier: "DetailsCountryViewController") as! DetailsCountryViewController
        view.country = parameter.getObject(type: CountryEntity.self)
        
        let interactor = DetailsCountryInteractor()
        let router = DetailsCountryRouter(viewController: view)
        let presenter = DetailsCountryPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

extension DetailsCountryRouter: DetailsCountryRouterProtocol {

}
