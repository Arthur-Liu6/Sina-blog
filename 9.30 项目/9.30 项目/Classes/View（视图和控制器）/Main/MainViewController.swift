//
//  MainViewController.swift
//  9.30 项目
//
//  Created by RUNYU LIU on 2022/10/10.
//

import UIKit

class MainViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //添加控制器不会创建tabbar中的按钮
        //因为懒加载
        addchildren()
        
        print(tabBar.subviews)
        
        setupComposedButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //会创建tabbar中的所有控制器对应的按钮
        super.viewWillAppear(animated)
        
        //将撰写按钮放到前面
        tabBar.bringSubviewToFront(composedbutton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //懒加载：添加按钮控件
    private lazy var composedbutton:UIButton = UIButton(
        imagename: "tabbar_compose_icon_add",
        backimagename: "tabbar_compose_button")
//    {
//
////        let button = UIButton()
////
////        button.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControl.State.normal)
////        button.setImage(UIImage(named: "tabbar_compose_icon_add_hightlighted"), for: UIControl.State.highlighted)
////        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControl.State.normal)
////        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControl.State.highlighted)
////
////        //根据背景图片调整尺寸
////        button.sizeToFit()
////
////        return button
//    }()
}

//mark：- 设置界面
extension MainViewController
{
    //添加撰写按钮
    private func setupComposedButton()
    {
        //1.
        tabBar.addSubview(composedbutton)
        //2.调整位置
        let count = children.count
        // - 1:让按钮变宽一点点
        let width =  tabBar.bounds.width / CGFloat(count) - 1
        
        composedbutton.frame = tabBar.bounds.insetBy(dx: 2*width, dy: 0)
    
    }
    
    //添加所有控制器
    private func addchildren()
    {
        //性能提升：能使用颜色，就不要使用图片
        tabBar.tintColor = UIColor.orange
        
        addChild(vc: HomeTableViewController(), title: "首页", imagename: "tabbar_home")
        addChild(vc: MessageTableViewController(), title: "消息", imagename: "tabbar_messagecenter")
        
        //按钮控件
        addChild(UIViewController())
        
        addChild(vc: DiscoverTableViewController(), title: "发现", imagename: "tabbar_discover")
        addChild(vc: ProfileTableViewController(), title: "我的", imagename: "tabbar_profile")
    }
    
    //添加控制器
    private func addChild(vc:UIViewController, title:String, imagename:String)
    {
        //设置标题-- 由内之外设置的
        vc.title = title
        //设置图像
        vc.tabBarItem.image = UIImage(named: imagename)
        //导航控制器
        let nav = UINavigationController(rootViewController: vc)
        
        addChild(nav)
    }
}
