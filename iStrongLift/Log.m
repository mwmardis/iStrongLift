
//
//  Log.m
//  iStrongLift
//
//  Created by Juan Vasquez on 5/11/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "Log.h"

@implementation Log

-(id) initWithWorkout:(Workout *)workout
{
    if (self) {
        _workout = workout;
    }
    return self;
}
@end
