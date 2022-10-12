//
//  UIButton+Extension.swift
//  9.30 项目
//
//  Created by RUNYU LIU on 2022/10/12.
//

import UIKit

extension UIButton
{
    //便利构造函数
    convenience init(imagename:String, backimagename:String)
    {
        self.init()
                
        setImage(UIImage(named: imagename), for: UIControl.State.normal)
        setImage(UIImage(named: imagename+"_hightlighted"), for: UIControl.State.highlighted)
        setBackgroundImage(UIImage(named: backimagename), for: UIControl.State.normal)
        setBackgroundImage(UIImage(named: backimagename+"_highlighted"), for: UIControl.State.highlighted)
        
        //根据背景图片调整尺寸
        sizeToFit()
    }

}
