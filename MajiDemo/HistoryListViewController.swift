//
//  HistoryListViewController.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import UIKit

class HistoryListViewController: UIViewController {
    lazy var table:UITableView = {
        let tb = UITableView.init(frame: .zero, style: .plain)
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    var dataList:Array<MainModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "history"
        self.view.backgroundColor = UIColor.white
        self.createUI()
    }
    func createUI(){
        self.view.addSubview(self.table)
        self.table.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension HistoryListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = "request time:" + dataList[indexPath.row].request_time
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = dataList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
