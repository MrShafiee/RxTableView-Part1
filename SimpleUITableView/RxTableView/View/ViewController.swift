//
//  ViewController.swift
//  SimpleUITableView
//
//  Created by Amin Shafiee on 10/28/1397 AP.
//  Copyright © 1397 amin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewControllerViewModel()
    private let disposeBag = DisposeBag()
    var rows = PublishSubject<[ViewControllerModel]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        
        setupBinding()
        viewModel.setDataSoruce()
    }

    func setupBinding(){
        
        viewModel.tableRowsItem
            .observeOn(MainScheduler.instance)
            .bind(to: rows)
            .disposed(by: disposeBag)
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        rows.bind(to: tableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) {  (row,item,cell) in
            
            cell.titleLbl.text = item.title
            cell.subtitleLbl.text = item.subtitle
            
        }.disposed(by: disposeBag)
        
        
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
