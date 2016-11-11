//
//  HomeSlideViewController.swift
//  TAT
//
//  Created by Chunbi Feng on 2016/10/8.
//  Copyright © 2016年 Chunbi Feng. All rights reserved.
//

import UIKit

class HomeSlideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //temp mode
    var bulletin = ["折價卷","訊息通知與公告","瀏覽紀錄"]
    var topics = ["主題文章1","主題文章2","主題文章3","主題文章4","主題文章5"]
    var categories = ["商品種類1","商品種類2","商品種類3","商品種類4","商品種類5","商品種類6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return bulletin.count
        case 1:
            return topics.count
        case 2:
            return categories.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = bulletin[indexPath.row]
        case 1:
            cell.textLabel?.text = topics[indexPath.row]
        case 2:
            cell.textLabel?.text = categories[indexPath.row]
        default:
            cell.textLabel?.text = "Other"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "公告區";
        case 1:
            return "主題推薦";
        case 2:
            return "商品分類";
        default:
            return "Other";
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
