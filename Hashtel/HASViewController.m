//
//  HASViewController.m
//  Hashtel
//
//  Created by Jurre Stender on 02/03/14.
//  Copyright (c) 2014 jurre. All rights reserved.
//

#import "HASViewController.h"
#import "NSString+Hashtel.h"

@interface HASViewController ()
@property(nonatomic, strong) NSArray *strings;
@end

@implementation HASViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;

  // Uncomment the following line to display an Edit button in the navigation
  // bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  self.strings = @[
    @"You probably haven't heard of it",
    @"Put a bird on it",
    @"pop-up tote bag",
    @"Whatevs",
    @"single-origin coffee pop-up",
    @"Etsy post-ironic tofu",
    @"Plaid Bushwick scenester",
    @"Jean shorts",
    @"I bet you still use Helvetica too…",
    @"Kale chips"
  ];
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.strings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                      forIndexPath:indexPath];

  NSString *string = self.strings[indexPath.row];

  cell.backgroundColor = [string color];
  cell.textLabel.textColor = [UIColor whiteColor];
  cell.textLabel.text = string;
  return cell;
}

@end
