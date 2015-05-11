//
//  LogViewController.m
//  iStrongLift
//
//  Created by Juan Vasquez on 5/11/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogViewController.h"
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
    
    NSString *CellIdentifier = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 20;
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
    
    NSSortDescriptor *dateSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *logs = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"logs"]];
    logs = [logs sortedArrayUsingDescriptors:@[dateSortDescriptor]];
    self.tableView.delegate = self;
    
    

    
    
}

@end