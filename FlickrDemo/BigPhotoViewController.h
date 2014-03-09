//
//  BigPhotoViewController.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface BigPhotoViewController : UIViewController
@property (nonatomic, strong) Photo *photo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)backClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *markAsViewed;
- (IBAction)markAsViewedClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *photoTitle;
@property (weak, nonatomic) IBOutlet UILabel *location;

@end
