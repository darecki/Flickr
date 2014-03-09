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
#import "BigPhotoViewController.h"

@interface PhotoGridViewController () <UICollectionViewDataSource>
@end

@implementation PhotoGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadPhotos];
    self.navigationItem.title = self.searchTerm;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
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
    
    Photo *photo = self.photoList[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    if (photo.thumbnail) {
        cell.photo = photo;
        if (photo.viewed == YES) {
            cell.backgroundColor = [UIColor yellowColor];
        }
    } else {

        NSURL *url = [FlickrApi urlForPhoto:photo size:@"s"];
        [FlickrApi downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                photo.thumbnail = image;
                cell.photo = photo;
            }
        }];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(PhotoCell *)sender
{
    if ([segue.identifier isEqualToString:@"show big photo"]) {
        BigPhotoViewController *dvc = segue.destinationViewController;
        dvc.photo = sender.photo;
    }
}
@end
