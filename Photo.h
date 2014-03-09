//
//  Photo.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject
@property (nonatomic, strong) NSString *farm;
@property (nonatomic, strong) NSString *server;
@property (nonatomic, strong) NSString *photo_id;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, assign) BOOL viewed;
@end
