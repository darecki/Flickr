//
//  FlickrApi.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FlickrSearchCompletionBlock)(NSString *searchTerm, id results, NSError *error);

@interface FlickrApi : NSObject

+ (void)photosForString:(NSString *)string completionBlock:(FlickrSearchCompletionBlock)completionBlock;

@end
