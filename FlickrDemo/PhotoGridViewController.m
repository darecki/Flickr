//
//  PhotoGridViewController.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "PhotoGridViewController.h"
#import "FlickrApi.h"

@interface PhotoGridViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@end

@implementation PhotoGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadPhotos];
}

- (void)loadPhotos
{
    [FlickrApi photosForString:self.searchTerm completionBlock:^(NSString *searchTerm, id results, NSError *error) {
        self.photoList = [[results objectForKey:@"photos"] objectForKey:@"photo"];
        [self.wheel stopAnimating];
        
        [self.collectionView reloadData];
    }];
    [self.wheel startAnimating];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [self.photoList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected item at index path %@", indexPath);
}

@end
