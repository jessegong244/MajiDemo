//
//  DetailViewController.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import UIKit

class DetailViewController: UIViewController {
    var model:MainModel!
    
    lazy var tv:UITextView = {
        let tv = UITextView.init()
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.model.request_time
        self.createUI()
        self.tv.text = self.model.description
    }

    func createUI(){
        self.view.addSubview(self.tv)
        self.tv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
