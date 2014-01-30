//
//  SCRestaurantDataSource.m
//  Assignment
//
//  Created by Philip Dow on 1/28/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import "SCRestaurantDataSource.h"
#import "SCRestaurant.h"

@interface SCRestaurantDataSource ()

@end

@implementation SCRestaurantDataSource

+ (id)sharedDataSource
{
    static dispatch_once_t once;
    static SCRestaurantDataSource *sharedDataSource;
    dispatch_once(&once, ^ {
      sharedDataSource = [[self alloc] init];
    });
    return sharedDataSource;
}

- (id) init
{
  self = [super init];
  if (self) {
    _restaurants = [NSArray array];
  }
  return self;
}

@end
