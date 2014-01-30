//
//  SCNewRestaurantViewController.h
//  Assignment
//
//  Created by Philip Dow on 1/30/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCNewRestaurantViewController;

@protocol SCNewRestaurantViewProtocol <NSObject>

- (void) restaurantViewDidSaveNewRestaurant:(SCNewRestaurantViewController*)aRestaurantController;

@end

@interface SCNewRestaurantViewController : UIViewController

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *kind;
@property (weak, nonatomic) id<SCNewRestaurantViewProtocol> delegate;

- (IBAction)save:(id)sender;

@end
