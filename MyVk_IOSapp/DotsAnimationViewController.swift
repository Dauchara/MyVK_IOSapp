//
//  DotsAnimationViewController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/22/21.
//

import UIKit

class DotsAnimationViewController: UIViewController {

    @IBOutlet var dotsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showAnimatingDotsInImageView()
    }
    

    func showAnimatingDotsInImageView() {
        let lay = CAReplicatorLayer()
        lay.frame = CGRect(x: 0, y: 8, width: 40, height: 60)
        
        let circle = CALayer()
        circle.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        circle.cornerRadius = circle.frame.width / 2
        circle.backgroundColor = UIColor(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1).cgColor
        
        lay.addSublayer(circle)
        lay.instanceCount = 3
        lay.instanceTransform = CATransform3DMakeTranslation(50, 0, 0)
        
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        anim.fromValue = 1.0
        anim.toValue = 0.2
        anim.duration = 0.7
        anim.repeatCount = .infinity
        
        circle.add(anim, forKey: nil)
        lay.instanceDelay = anim.duration / Double(lay.instanceCount)
        
        self.dotsImage.layer.addSublayer(lay)
    }

}
