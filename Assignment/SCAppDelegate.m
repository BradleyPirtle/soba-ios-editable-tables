//
//  SCAppDelegate.m
//  Assignment
//
//  Created by Philip Dow on 1/28/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import "SCAppDelegate.h"
#import "SCRestaurantDataSource.h"
#import "SCRestaurant.h"

//#import "FMDatabase.h"

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Load data from the application bundle
  
    /*
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"]];
    for (NSDictionary *dict in array) {
      [[[SCRestaurantDataSource sharedDataSource] mutableArrayValueForKey:@"restaurants"]
        addObject:[SCRestaurant restaurantWithDictionary:dict]];
    }
    */
  
    // Copy default data to application's documents directory
  
    /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
  
    NSString *documentsPlistPath = [documentsDirectory stringByAppendingPathComponent:@"restaurants_data.plist"];
    NSString *applicationPlistPath = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];

    NSFileManager *fm = [[NSFileManager alloc] init];
  
    if ( ![fm fileExistsAtPath:documentsPlistPath] ) {
      NSLog(@"Copying default property list data on first run");

      NSError *error;
      BOOL success = [fm copyItemAtPath:applicationPlistPath toPath:documentsPlistPath error:&error];
      if ( !success ) {
          NSLog(@"%@",error);
      }
    }
    */
  
    // Load data from documents directory
  
    /*
    NSArray *array = [NSArray arrayWithContentsOfFile:documentsPlistPath];
    for (NSDictionary *dict in array) {
      [[[SCRestaurantDataSource sharedDataSource] mutableArrayValueForKey:@"restaurants"]
        addObject:[SCRestaurant restaurantWithDictionary:dict]];
    }
    */
  
    // ensure data is available in sql database, if not then create and populate
  
    /*
    NSString *documentsDatabasePath = [self documentsDatabasePath];
    NSFileManager *fm = [[NSFileManager alloc] init];

    if ( ![fm fileExistsAtPath:documentsDatabasePath] ) {
        NSLog(@"Creating default database on first run");
      
        FMDatabase *database = [FMDatabase databaseWithPath:documentsDatabasePath];
        if ( ![database open] ) {
          NSLog(@"There was a problem creating the default database");
        } else {
          NSString *create = @"CREATE TABLE restaurants( "
                  "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "name TEXT, "
                  "kind TEXT)";

          BOOL success = [database executeUpdate:create];
          if ( !success ) {
              NSLog(@"There was a problem executing the create query");
          } else {
          
            // populate the database with the original application bundle data
            
            NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"]];
            for (NSDictionary *dict in array) {
              NSString *insert = @"INSERT INTO restaurants (name, kind) VALUES (:name, :kind)";
              BOOL success = [database executeUpdate:insert withParameterDictionary:dict];
              if ( !success ) {
                  NSLog(@"There was a problem adding default data to the destinations table: %@", dict);
              }
            }
          }

          [database close];
        }
    }
    */
  
    // Override point for customization after application launch.
    return YES;
}

- (NSString*)documentsDatabasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // set up a view filepaths
    NSString *documentsPlistPath = [documentsDirectory stringByAppendingPathComponent:@"restaurants_data.sqlite"];
    
    return documentsPlistPath;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  
  // [self saveApplicationData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  
  // [self saveApplicationData];
}

#pragma mark -

/*
- (void) saveApplicationData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentsPlistPath = [documentsDirectory stringByAppendingPathComponent:@"restaurants_data.plist"];
  
    NSMutableArray *dicts = [NSMutableArray array];
    for (SCRestaurant *restaurant in [[SCRestaurantDataSource sharedDataSource] restaurants]) {
      [dicts addObject:[restaurant dictionaryRepresentation]];
    }
  
    if (![dicts writeToFile:documentsPlistPath atomically:YES]) {
      NSLog(@"There was a problem saving the data");
    }
}
*/



@end
