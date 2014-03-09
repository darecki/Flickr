//
//  PhotoGridViewController.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoGridViewController : UICollectionViewController
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSString *searchTerm;
@property (nonatomic, strong) NSMutableArray *photoList;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *wheel;

@end
