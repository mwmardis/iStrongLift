//
//  User.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/5/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

// users 1-rep maxes
extern NSString *MAX_BENCH;
extern NSString *MAX_SQUAT;
extern NSString *MAX_DEADLIFT;
extern NSString *MAX_OVERHEAD;
extern NSString *MAX_ROW;

// recommended weights to lift. Will be incremented as workouts are successful
extern NSString *REC_BENCH;
extern NSString *REC_SQUAT;
extern NSString *REC_DEADLIFT;
extern NSString *REC_OVERHEAD;
extern NSString *REC_ROW;

// variables for enabling accessory exercises, dips and pullups
extern NSString *DIPS_ENABLED;
extern NSString *PULLUPS_ENABLED;

extern NSString *PREVIOUS_WORKOUT_COMPLETED;
extern NSString *A_PREVIOUS;

extern NSString *USER_WEIGHT;




@end
