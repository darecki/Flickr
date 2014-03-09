//
//  PhotoCell.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)setPhoto:(Photo *)photo
{
    if(_photo != photo) {
        _photo = photo;
    }
    self.imageView.image = _photo.thumbnail;
    self.title = _photo.title;
    self.location = [NSString stringWithFormat:@"%@, %@", _photo.longitude, _photo.latitude];
}

@end
