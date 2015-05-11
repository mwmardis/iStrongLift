//
//  Workout.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"
@interface Workout : NSObject


// date
@property (readwrite, assign) NSDate *date;

// array of exercises
@property (strong, nonatomic) NSMutableArray *exercises;

// Name of workout
@property (nonatomic, strong) NSString *name;


- (id)initStrongLiftA;
- (id)initStrongLiftB;

// versions with pullups and dips enabled
- (id)initStrongLiftAExtended;
- (id)initStrongLiftBExtended;

@end


