//
//  BigPhotoViewController.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "BigPhotoViewController.h"
#import "FlickrApi.h"

@interface BigPhotoViewController ()

@end

@implementation BigPhotoViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkPhotoViewed];
    self.imageView.image = self.photo.thumbnail;
    self.photoTitle.text = self.photo.title;
    self.location.text = [NSString stringWithFormat:@"%@, %@", self.photo.latitude, self.photo.longitude];
    if ([self.location.text isEqualToString:@"0, 0"]) {
        self.location.text = @"";
    }
    
    NSURL *url = [FlickrApi urlForPhoto:self.photo size:@"b"];
    [FlickrApi downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            self.imageView.image = image;
        }
    }];
}

- (IBAction)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)markAsViewedClicked:(UIButton *)sender
{
    self.photo.viewed = YES;
    [self checkPhotoViewed];
}

- (void)checkPhotoViewed
{
    if(self.photo.viewed == YES) {
        [self.markAsViewed setTitle:@"Viewed" forState:UIControlStateNormal];
    }
}
@end
