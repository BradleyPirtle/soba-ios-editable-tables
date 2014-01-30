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
    // Don't do this! =)
    NSArray *dicts = @[
      @{
        @"name": @"Srirachi High",
        @"kind": @"Thai"
      },
      @{
        @"name": @"Jim's Barbeque",
        @"kind": @"American"
      },
      @{
        @"name": @"On the Border",
        @"kind": @"TexMex"
      },
      @{
        @"name": @"Outback Steakhouse",
        @"kind": @"American"
      },
      @{
        @"name": @"Gopuram",
        @"kind": @"Indian"
      },
      @{
        @"name": @"The Fishnet",
        @"kind": @"Sushi"
      },
      @{
        @"name": @"Himalayas",
        @"kind": @"Indian"
      },
      @{
        @"name": @"Bloody Delicious",
        @"kind": @"British"
      },
      @{
        @"name": @"Food for Thought",
        @"kind": @"Vegetarian"
      },
      @{
        @"name": @"Everything Cheese",
        @"kind": @"American"
      },
      @{
        @"name": @"Fried Fiesta",
        @"kind": @"TexMex"
      },
      @{
        @"name": @"Subway",
        @"kind": @"Deli"
      },
    ];
    
    _restaurants = [NSArray array];
    for (NSDictionary *entry in dicts) {
      [[self mutableArrayValueForKey:@"restaurants"] addObject:[SCRestaurant restaurantWithDictionary:entry]];
    }
    
  }
  
  return self;
}

@end
