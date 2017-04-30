//
//  ModalAnimation.swift
//  FirebaseSample
//
//  Created by Miku Shimizu on 2017/04/20.
//  Copyright © 2017年 Miku Shimizu. All rights reserved.
//

// http://qiita.com/kitoko552/items/4c0e411ff6224090db87

import UIKit
import SafariServices

class ModalAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.3
    var presenting = false
    let MovedDistance: CGFloat = 70.0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        // アニメーションの時間（duration）を返します。
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // ここでアニメーションの具体的な内容を書きます。
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        if presenting {
            presentTransition(transitionContext: transitionContext, toView: toVC!.view, fromView: fromVC!.view)
        }
        else{
            dismissTransition(transitionContext: transitionContext, toView: toVC!.view, fromView: fromVC!.view)
        }
    }
    
    func presentTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, aboveSubview: fromView)
        
        // 遷移先のviewを画面の下側に移動させておく。
        toView.frame = toView.frame.offsetBy(dx: 0, dy: containerView.frame.size.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: { () -> Void in
            // アニメーションの具体的な内容
            // 遷移元のalpha値を下げて少し暗くする。
            fromView.alpha = 0.7
            
            // 遷移先のviewを画面全体にはまるように移動させる。
            toView.frame = containerView.frame
            
        }) { (finished) -> Void in
            // 完了後の処理
            transitionContext.completeTransition(true)
        }
    }
    
    func dismissTransition(transitionContext: UIViewControllerContextTransitioning, toView: UIView, fromView: UIView) {
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView) // fromViewの下にtoView
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: { () -> Void in
            toView.frame = fromView.frame.offsetBy(dx: 0, dy: containerView.frame.size.height)
            fromView.alpha = 1.0
            
        }) { (finished) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
}
