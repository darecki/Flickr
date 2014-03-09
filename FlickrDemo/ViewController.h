//
//  ViewController.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 08/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *searchTerm;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *wheel;
- (IBAction)startSearching:(id)sender;


@end
