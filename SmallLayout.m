//
//  SmallLayout.m
//  FlickrDemo
//
//  Created by Darek Cieśla on 09/03/14.
//  Copyright (c) 2014 Darek Cieśla. All rights reserved.
//

#import "SmallLayout.h"

@implementation SmallLayout
- (id)init
{
    if (!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake(65, 65);
    self.sectionInset = UIEdgeInsetsMake(3, 3, 3, 3);
    self.minimumInteritemSpacing = 5.0f;
    self.minimumLineSpacing = 5.0f;
    
    return self;
}
@end
