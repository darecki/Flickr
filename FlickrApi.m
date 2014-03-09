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
//                                 @"per_page":@10
                                 };
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:apiBasePath parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        completionBlock(string, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(string, nil, error);
    }];
}

+ (void)downloadImageWithURL:(NSURL *)url completionBlock:(FlickDownloadImageCompletionBlock)completionBlock
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFImageResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        UIImage *image = responseObject;
        completionBlock(YES,image);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        completionBlock(NO,nil);
    }];
    
    [operation start];
    
//    
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                               if ( !error )
//                               {
//                                   UIImage *image = [[UIImage alloc] initWithData:data];
//                                   completionBlock(YES,image);
//                               } else{
//                                   completionBlock(NO,nil);
//                               }
//                           }];
}

+ (NSURL *)urlForPhoto:(Photo *)photo size:(NSString *)size
{
    if (!size) {
        size = @"t";
    }
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@_%@.jpg", photo.farm, photo.server, photo.photo_id, photo.secret, size]];
}
@end
