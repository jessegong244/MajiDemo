//
//  ViewController.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import UIKit
import Foundation
import SnapKit


class ViewController: UIViewController {
    lazy var df:DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df
    }()
    lazy var tv:UITextView = {
        let tv = UITextView.init()
        return tv
    }()
    var timer:Timer?
    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weak var weakSelf = self
        self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (t) in
            weakSelf!.request()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Main"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "history", style:.plain, target: self, action: #selector(toHistory))
        self.createUI()
    }
    
    func createUI(){
        self.view.addSubview(self.tv)
        self.tv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let arr = RealmManager.queryModel(model: MainModel(), filter:nil)
        if arr.count > 0 {
            let lastModel:MainModel = arr.last!
            self.tv.text = lastModel.description
        }
    }

    @objc func request(){
        mainRequest { (model, error) in
            if let err = error {
                print("err = ",err)
                return
            }
            if let m = model{
                m.request_time = self.df.string(from: Date())
                RealmManager.addModel(model: m)
                self.tv.text = m.description
            }
        }
    }
    
    @objc func toHistory(){
        let vc = HistoryListViewController()
        vc.dataList = RealmManager.queryModel(model: MainModel(), filter:nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

