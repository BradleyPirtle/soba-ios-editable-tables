//
//  SCRestaurantsViewController.m
//  Assignment
//
//  Created by Philip Dow on 1/28/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import "SCRestaurantsViewController.h"
#import "SCNewRestaurantViewController.h"
#import "SCRestaurantCell.h"
#import "SCRestaurantDataSource.h"
#import "SCRestaurant.h"

//#import "FMDatabase.h"

@interface SCRestaurantsViewController ()

/*
@property (strong, nonatomic) FMDatabase *database;
@property (strong, nonatomic) NSArray *restaurants;
*/

@end

@implementation SCRestaurantsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
  
    [self loadData];
}

- (void)loadData
{
    // load the data from a sql database: lets put this in our data source
  
    /*
    self.restaurants = [NSArray array];
  
    NSString *documentsDatabasePath = [self documentsDatabasePath];
    NSFileManager *fm = [[NSFileManager alloc] init];
  
    if (![fm fileExistsAtPath:documentsDatabasePath]) {
      NSLog(@"CRITCIAL ERROR - database should exist at this point");
    } else {
      self.database = [FMDatabase databaseWithPath:documentsDatabasePath];
      if ( ![self.database open] ) {
          NSLog(@"There was a problem opening the default database");
      } else {
          NSString *query = @"SELECT * FROM restaurants";
          FMResultSet *results = [self.database executeQuery:query];
          while ( [results next] ) {
              NSDictionary *aResult = [results resultDictionary];
              NSLog(@"%@", aResult);
              [[self mutableArrayValueForKey:@"restaurants"] addObject:aResult];
          }
      }
    }
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Disposer of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[SCRestaurantDataSource sharedDataSource] restaurants] count];
    //return self.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SCRestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.nameLabel.text = [[[SCRestaurantDataSource sharedDataSource] restaurants][indexPath.row] name];
    cell.kindLabel.text = [[[SCRestaurantDataSource sharedDataSource] restaurants][indexPath.row] kind];
    //cell.nameLabel.text = self.restaurants[indexPath.row][@"name"];
    //cell.kindLabel.text = self.restaurants[indexPath.row][@"kind"];
    cell.previewView.image = [UIImage imageNamed:@"food.jpg"];
  
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[[SCRestaurantDataSource sharedDataSource] mutableArrayValueForKey:@"restaurants"] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
      
        /*
        NSDictionary *restaurant = [self.restaurants objectAtIndex:indexPath.row];
        NSString *name = [restaurant objectForKey:@"name"];

        // update the database
        NSString *delete = @"DELETE FROM restaurants WHERE name = ?";
        BOOL success = [_database executeUpdate:delete, name];
        if ( !success ) {
            NSLog(@"There was a problem removing this restaurant from the database");
        } else {
          // if successful, update our array
          [[self mutableArrayValueForKey:@"restaurants"] removeObjectAtIndex:indexPath.row];
          
          // then update the table view
          [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        */
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  
    if ([[segue identifier] isEqualToString:@"ShowRestaurant"]) {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      [[segue destinationViewController] setTitle:[[[SCRestaurantDataSource sharedDataSource] restaurants] [indexPath.row] name]];
    } else if ([[segue identifier] isEqualToString:@"NewRestaurant"]) {
      [[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark New Restaurant Delegate
- (void) restaurantViewDidSaveNewRestaurant:(SCNewRestaurantViewController*)aRestaurantController
{
  NSLog(@"did save %@ %@", aRestaurantController.name, aRestaurantController.kind);
  [self.navigationController popViewControllerAnimated:YES];
  
  SCRestaurant *newRestaurant = [SCRestaurant restaurantWithDictionary:@{
    @"name": aRestaurantController.name,
    @"kind": aRestaurantController.kind
  }];
  
  [self insertRestaurant:newRestaurant];
}

- (void) insertRestaurant:(SCRestaurant*)aRestaurant
{
    [[[SCRestaurantDataSource sharedDataSource] mutableArrayValueForKey:@"restaurants"] insertObject:aRestaurant atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
        withRowAnimation:UITableViewRowAnimationAutomatic];
  
    // Again we need to update the database and our local array copy
    // I've kept the use of SCRestaurant here because I've added methods to convert to and from dictionaries
  
    // update the sql database
    /*
    NSString *insert = @"INSERT INTO restaurants (name, kind) VALUES (:name, :kind)";
    BOOL success = [self.database executeUpdate:insert withParameterDictionary:[aRestaurant dictionaryRepresentation]];
    if ( !success ) {
        NSLog(@"There was a problem adding default data to the restaurants table: %@", [aRestaurant dictionaryRepresentation]);
    } else {
      // if successful, update our array
      [[self mutableArrayValueForKey:@"restaurants"] insertObject:[aRestaurant dictionaryRepresentation] atIndex:0];
      
      // and update the table
      [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
        withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    */
}

/*
- (NSString*)documentsDatabasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // set up a view filepaths
    NSString *documentsPlistPath = [documentsDirectory stringByAppendingPathComponent:@"restaurants_data.sqlite"];
    
    return documentsPlistPath;
}
*/

@end
