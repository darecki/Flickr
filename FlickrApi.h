//
//  FlickrApi.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrApi : NSObject

+ (void)photosForString:(NSString *)string;

@end
