//
//  WorkoutViewController.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout.h"

@interface WorkoutViewController : UITableViewController

@property (strong, nonatomic) Workout *workout;

@end
