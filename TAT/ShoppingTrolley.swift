//
//  ShoppingTrolley.swift
//  TAT
//
//  Created by Liu Jun Wei on 2016/11/4.
//  Copyright © 2016年 Chunbi Feng. All rights reserved.
//

import UIKit

class ShoppingTrolley: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.stackView.tintColor = UIColor.blue
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.1960784314, blue: 0.4980392157, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
