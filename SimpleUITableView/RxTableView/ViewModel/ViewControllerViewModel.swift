//
//  ViewControllerViewModel.swift
//  SimpleUITableView
//
//  Created by Amin Shafiee on 10/28/1397 AP.
//  Copyright © 1397 amin. All rights reserved.
//

import Foundation
import RxSwift

class ViewControllerViewModel: NSObject {
    
    var tableRowsItem = PublishSubject<[ViewControllerModel]>()
    
    func setDataSoruce() {
        
        var items = [ViewControllerModel]()
        
        items.append( ViewControllerModel(title:"title number 1", subtitle:"show subtitle number 1") )
        items.append( ViewControllerModel(title:"title number 2", subtitle:"show subtitle number 2") )
        items.append( ViewControllerModel(title:"title number 3", subtitle:"show subtitle number 3") )
        items.append( ViewControllerModel(title:"title number 4", subtitle:"show subtitle number 4") )
        items.append( ViewControllerModel(title:"title number 5", subtitle:"show subtitle number 5") )
        items.append( ViewControllerModel(title:"title number 6", subtitle:"show subtitle number 6") )
        items.append( ViewControllerModel(title:"title number 7", subtitle:"show subtitle number 7") )
        
        tableRowsItem.onNext(items)
        
    }
}
