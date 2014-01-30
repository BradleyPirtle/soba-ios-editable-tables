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

@interface SCRestaurantsViewController ()

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
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SCRestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.nameLabel.text = [[[SCRestaurantDataSource sharedDataSource] restaurants][indexPath.row] name];
    cell.kindLabel.text = [[[SCRestaurantDataSource sharedDataSource] restaurants][indexPath.row] kind];
    cell.previewView.image = [UIImage imageNamed:@"food.jpg"];
  
    return cell;
}

/*
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

@end
