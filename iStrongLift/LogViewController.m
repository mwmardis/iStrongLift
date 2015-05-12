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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Workout *currWorkout = [self.logs objectAtIndex:indexPath.row];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate: currWorkout.date];
    
    
   // NSLog(@"Date : %@", stringFromDate);
    NSString *CellIdentifier = @"log_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = stringFromDate;
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


-(void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
 
    
}

-(void) viewDidLoad
{
    
    NSMutableArray *logV= [NSKeyedUnarchiver unarchiveObjectWithData:[self.defaults objectForKey:@"logs"]];
    self.logs = [[NSMutableArray alloc] initWithArray:logV];
    [self printArray: self.logs];
    
  //  NSSortDescriptor *dateSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    
 //   NSMutableArray *logs = [[NSMutableArray alloc] initWithArray:[self.defaults objectForKey:@"logs"]];
    //logs = [logs sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    self.tableView.delegate = self;
    

    
}

-(void) printArray: (NSMutableArray*) arr
{
    for (id obj in arr)
        NSLog(@"Object: %@", obj);
}

@end