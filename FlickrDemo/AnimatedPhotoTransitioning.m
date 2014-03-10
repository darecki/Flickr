//
//  DCAnimatedTransitioning.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 10/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "AnimatedPhotoTransitioning.h"

@implementation AnimatedPhotoTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (!self.dismissing) {
        toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else if (self.dismissing) {
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }

}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

@end