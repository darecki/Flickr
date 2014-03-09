//
//  FlickrApi.h
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"
typedef void (^FlickrSearchCompletionBlock)(NSString *searchTerm, id results, NSError *error);
typedef void (^FlickDownloadImageCompletionBlock)(BOOL succeeded, UIImage *image);

@interface FlickrApi : NSObject

+ (void)photosForString:(NSString *)string completionBlock:(FlickrSearchCompletionBlock)completionBlock;
+ (void)downloadImageWithURL:(NSURL *)url completionBlock:(FlickDownloadImageCompletionBlock)completionBlock;
+ (NSURL *)urlForPhoto:(Photo *)photo size:(NSString *)size;
@end
