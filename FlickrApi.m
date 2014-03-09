//
//  FlickrApi.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "FlickrApi.h"
#import "Pods/AFNetworking/AFNetworking/AFNetworking.h"

@implementation FlickrApi

static NSString * const apiBasePath = @"http://api.flickr.com/services/rest/";
static NSString * const apiKey = @"050464fdf5c8e3db505ddbbf16370bf9";

+ (void)photosForString:(NSString *)string completionBlock:(FlickrSearchCompletionBlock)completionBlock
{
    NSDictionary *parameters = @{@"method":@"flickr.photos.search",
                                 @"api_key":apiKey,
                                 @"format":@"json",
                                 @"nojsoncallback":@1,
                                 @"text":string,
                                 @"media":@"photos",
                                 @"extras":@"geo",
                                 @"per_page":@40
                                 };
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:apiBasePath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        completionBlock(string, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(string, nil, error);
    }];
}

@end
