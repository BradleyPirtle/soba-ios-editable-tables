//
//  SCRestaurant.m
//  Assignment
//
//  Created by Philip Dow on 1/28/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import "SCRestaurant.h"

@implementation SCRestaurant

+ (id) restaurantWithDictionary:(NSDictionary*)dictionary
{
  return [[SCRestaurant alloc] initWithDictionary:dictionary];
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
  self = [super init];
  if (self) {
    [self setValuesForKeysWithDictionary:dictionary];
  }
  return self;
}

@end
