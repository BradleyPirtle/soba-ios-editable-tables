//
//  SCRestaurant.h
//  Assignment
//
//  Created by Philip Dow on 1/28/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCRestaurant : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *kind;

+ (id) restaurantWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

- (NSDictionary*) dictionaryRepresentation;

@end
