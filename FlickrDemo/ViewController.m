//
//  ViewController.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 08/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "ViewController.h"
#import "FlickrApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startSearching:(id)sender
{
    NSString *text = self.searchTerm.text;
    if (text.length) {
        [FlickrApi photosForString:text completionBlock:^(NSString *searchTerm, id results, NSError *error) {
            NSLog(@"Search:%@", searchTerm);
            NSLog(@"Results:%@", results);
            NSLog(@"Error: %@", error);
            [self.wheel stopAnimating];
        }];
        [self.wheel startAnimating];
    }
}

@end
