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
    

    [FlickrApi photosForString:@"wroclaw"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
