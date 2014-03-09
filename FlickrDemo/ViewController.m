//
//  ViewController.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 08/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "ViewController.h"
#import "PhotoGridViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)startSearching:(id)sender
{
    if (self.searchTerm.text.length) {
        [self performSegueWithIdentifier:@"show photo grid" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.searchTerm resignFirstResponder];
    PhotoGridViewController *dvc = segue.destinationViewController;
    dvc.searchTerm = self.searchTerm.text;
}
@end
