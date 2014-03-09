//
//  PhotoGridViewController.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "PhotoGridViewController.h"
#import "FlickrApi.h"
#import "Photo.h"
#import "PhotoCell.h"

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
        NSArray *rawPhotoDataList = results[@"photos"][@"photo"];
        self.photoList = [[NSMutableArray alloc] init];
        for (NSDictionary *item in rawPhotoDataList) {
            Photo *photo = [[Photo alloc] init];
            photo.farm = item[@"farm"];
            photo.photo_id = item[@"id"];
            photo.secret = item[@"secret"];
            photo.server = item[@"server"];
            photo.title = item[@"title"];
            photo.latitude = item[@"latitude"];
            photo.longitude = item[@"longitude"];
            
            NSURL *url = [FlickrApi urlForPhoto:photo size:@"t"];
            NSData *data = [NSData dataWithContentsOfURL:url];

            UIImage *image = [UIImage imageWithData:data];
            photo.thumbnail = image;
            
            [self.photoList addObject:photo];
        }
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
    PhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.photo = self.photoList[indexPath.row];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected item at index path %@", indexPath);
}

@end
