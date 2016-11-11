//
//  HomeMainViewController.swift
//  TAT
//
//  Created by Chunbi Feng on 2016/10/4.
//  Copyright © 2016年 Chunbi Feng. All rights reserved.
//

import UIKit

class HomeMainViewController: SlideMenuController, SlideMenuControllerDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var centerTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var carouselScrollView: UIScrollView!

    @IBAction func leftSlideButton(_ sender: UIBarButtonItem) {
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func followLetfBtnTableView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
            self.homeScrollView.contentOffset.x = 0
            }, completion: nil)
    }
    
    @IBAction func followCenterBtnTableView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
            self.homeScrollView.contentOffset.x = self.view.frame.width
            }, completion: nil)
    }
    
    @IBAction func followRightBtnTableView(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: { () -> Void in
            self.homeScrollView.contentOffset.x = self.view.frame.width * 2
            }, completion: nil)
    }
    
    let scrollBar = UIView()
    //temp mode
    var left = ["L1", "L2", "L3"]
    var center = ["C1", "C2", "C3"]
    var right = ["R1", "R2", "R3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let width = self.view.frame.width
        let height = self.view.frame.height

        slideMenuController()?.delegate = self
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.1960784314, blue: 0.4980392157, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.7921568627, green: 0.1960784314, blue: 0.4980392157, alpha: 1)
        self.tabBarController?.tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
        self.view.addSubview(self.scrollBar)
        self.scrollBar.backgroundColor = #colorLiteral(red: 0.7921568627, green: 0.1960784314, blue: 0.4980392157, alpha: 1)
        self.scrollBar.frame = CGRect.init(x: 20, y: 38, width: (self.view.frame.width / 3) - 40, height: 2)
        
        //set top button color
        self.leftButton.setTitleColor(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1), for: .normal)
        self.centerButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.rightButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        //tableView config
        self.leftTableView.delegate = self
        self.leftTableView.dataSource = self
        self.leftTableView.separatorStyle = .none
        self.centerTableView.delegate = self
        self.centerTableView.dataSource = self
        self.centerTableView.separatorStyle = .none
        self.rightTableView.delegate = self
        self.rightTableView.dataSource = self
        self.rightTableView.separatorStyle = .none
        self.leftTableView.frame = CGRect.init(x: 0, y: 100, width: width, height: height - 100)
        self.centerTableView.frame = CGRect.init(x: width, y: 0, width: width, height: height)
        self.rightTableView.frame = CGRect.init(x: width * 2, y: 0, width: width, height: height)
        
        //homeScrollView config
        self.homeScrollView.delegate = self
        self.homeScrollView.contentSize = CGSize.init(width: width * 3, height: height)
        self.homeScrollView.isPagingEnabled = true
        self.homeScrollView.isDirectionalLockEnabled = true
        self.homeScrollView.showsVerticalScrollIndicator = false
        self.homeScrollView.showsHorizontalScrollIndicator = false
        self.homeScrollView.scrollsToTop = false
        
        //carouselScrollView config
        self.carouselScrollView.delegate = self
        self.carouselScrollView.contentSize = CGSize(width: width, height: 100)
        //set carousel image and auto scroll
        let carouselImage1 = getImageWithColor(color: .blue, size: CGSize(width: width, height: 100))
        let carouselImage2 = getImageWithColor(color: .cyan, size: CGSize(width: width, height: 100))
        let carouselImage3 = getImageWithColor(color: .purple, size: CGSize(width: width, height: 100))
        self.carouselScrollView.auk.show(image: carouselImage1)
        self.carouselScrollView.auk.show(image: carouselImage2)
        self.carouselScrollView.auk.show(image: carouselImage3)
        self.carouselScrollView.auk.startAutoScroll(delaySeconds: 4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        if let leftController = self.storyboard?.instantiateViewController(withIdentifier: "homeLeft"){
            self.leftViewController = leftController
        }
        super.awakeFromNib()
    }
    
    func leftWillOpen() {
        self.homeScrollView.isHidden = true
        self.topStackView.isHidden = true
        self.scrollBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func leftDidClose() {
        self.homeScrollView.isHidden = false
        self.topStackView.isHidden = false
        self.scrollBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.leftTableView:
            return left.count
        case self.centerTableView:
            return center.count
        case self.rightTableView:
            //粉絲團
            return right.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if tableView == self.leftTableView
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "LeftCell", for: indexPath)
            cell.textLabel?.text = left[indexPath.row]
        }
        else if tableView == self.centerTableView
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "CenterCell", for: indexPath)
            cell.textLabel?.text = center[indexPath.row]

        }
        else
        {
            //self.rightTableView
            //粉絲團
            cell = tableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath)
            cell.textLabel?.text = right[indexPath.row]

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.homeScrollView {
            let offsetX = scrollView.contentOffset.x
            self.scrollBar.frame = CGRect.init(x: offsetX / 3 + 20, y: 38, width: (self.view.frame.width / 3) - 40, height: 2)
            
            if offsetX >= self.view.frame.width * 2 {
                //right button
                self.leftButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                self.centerButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                self.rightButton.setTitleColor(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1), for: .normal)
            } else if offsetX >= self.view.frame.width {
                //center button
                self.leftButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                self.centerButton.setTitleColor(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1), for: .normal)
                self.rightButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            } else {
                //left button
                self.leftButton.setTitleColor(#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1), for: .normal)
                self.centerButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                self.rightButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            }
        }
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
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
