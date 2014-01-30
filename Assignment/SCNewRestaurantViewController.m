//
//  SCNewRestaurantViewController.m
//  Assignment
//
//  Created by Philip Dow on 1/30/14.
//  Copyright (c) 2014 Philip Dow. All rights reserved.
//

#import "SCNewRestaurantViewController.h"

@interface SCNewRestaurantViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *kindField;

@end

@implementation SCNewRestaurantViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
  self.name = self.nameField.text;
  self.kind = self.kindField.text;
  
  [self.delegate restaurantViewDidSaveNewRestaurant:self];
}

@end
