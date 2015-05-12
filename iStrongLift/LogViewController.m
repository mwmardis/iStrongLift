//
//  LogViewController.m
//  iStrongLift
//
//  Created by Juan Vasquez on 5/11/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogViewController.h"
#import "Workout.h"
#import "DetailLogViewController.h"
@interface LogViewController ()
@property (nonatomic, strong)NSUserDefaults *defaults;
@property (nonatomic, strong)NSMutableArray *logs;
@end


@implementation LogViewController

-(NSMutableArray* ) logs
{
    if(!_logs)
    {
        _logs = [[NSMutableArray alloc] init];
    }
    return _logs;
}
-(NSUserDefaults*) defaults
{
    if(!_defaults)
    {
        _defaults = [NSUserDefaults standardUserDefaults];
    }
    return _defaults;
}

-(void) viewDidLoad
{
    self.navigationItem.title = @"History";
    NSMutableArray *logV= [NSKeyedUnarchiver unarchiveObjectWithData:[self.defaults objectForKey:@"logs"]];
    self.logs = [[NSMutableArray alloc] initWithArray:logV];
    //[self printArray: self.logs];
    
    //  NSSortDescriptor *dateSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
    //   NSMutableArray *logs = [[NSMutableArray alloc] initWithArray:[self.defaults objectForKey:@"logs"]];
    //logs = [logs sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    self.tableView.delegate = self;
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.logs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Workout *currWorkout = [self.logs objectAtIndex:indexPath.row];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate: currWorkout.date];
    
    
    // NSLog(@"Date : %@", stringFromDate);
    NSString *CellIdentifier = @"log_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = currWorkout.name;
    cell.detailTextLabel.text = stringFromDate;
    
    return cell;
}


-(void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
 
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Workout *workout = [self.logs objectAtIndex:indexPath.row];
    
    if([segue.identifier isEqualToString:@"log_to_detail"])
    {
        
        DetailLogViewController *vc = [segue destinationViewController];
        vc.workout = workout;
        
    }
    
    
}



@end