//
//  Workout.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "Workout.h"
#import "Exercise.h"
@implementation Workout


// constructors for stronglift A workout
- (id)initStrongLiftA {
    self = [super init];
    if (self) {
        _name = @"Workout A";
        
        Exercise *squatExercise = [[Exercise alloc]initWithName:squat targetSets:5 targetReps:5 picture: squatPicture];
        Exercise *benchPressExercise = [[Exercise alloc]initWithName:benchPress targetSets:5 targetReps:5 picture:benchPressPicture];
        Exercise *barbellRowExercise = [[Exercise alloc]initWithName:barbellRow targetSets:5 targetReps:5 picture:barbellRowPicture];
        
        
        _exercises = [NSMutableArray arrayWithObjects:squatExercise, benchPressExercise, barbellRowExercise, nil];
        
    }
    return self;
}

- (id)initStrongLiftAExtended {
    self = [super init];
    if (self) {
        _name = @"Workout A";
        
        Exercise *squatExercise = [[Exercise alloc]initWithName:squat targetSets:5 targetReps:5 picture: squatPicture];
        Exercise *benchPressExercise = [[Exercise alloc]initWithName:benchPress targetSets:5 targetReps:5 picture:benchPressPicture];
        Exercise *barbellRowExercise = [[Exercise alloc]initWithName:barbellRow targetSets:5 targetReps:5 picture:barbellRowPicture];
        Exercise *dipsExercise = [[Exercise alloc]initWithName:dips targetSets:3 targetReps:8 picture:dipsPicture];
        
        _exercises = [NSMutableArray arrayWithObjects:squatExercise, benchPressExercise, barbellRowExercise, dipsExercise, nil];
        
    }
    return self;
}

- (id)initStrongLiftB {
    self = [super init];
    if (self) {
        _name = @"Workout B";
        
        Exercise *squatExercise = [[Exercise alloc]initWithName:squat targetSets:5 targetReps:5 picture: squatPicture];
        Exercise *overheadPressExercise = [[Exercise alloc]initWithName:overheadPress targetSets:5 targetReps:5 picture:overheadPressPicture];
        Exercise *deadliftExercise = [[Exercise alloc]initWithName:deadlift targetSets:1 targetReps:5 picture:deadliftPicture];
        
        _exercises = [NSMutableArray arrayWithObjects:squatExercise, overheadPressExercise, deadliftExercise, nil];
        
    }
    return self;
}

- (id)initStrongLiftBExtended {
    self = [super init];
    if (self) {
        _name = @"Workout B";
        
        Exercise *squatExercise = [[Exercise alloc]initWithName:squat targetSets:5 targetReps:5 picture: squatPicture];
        Exercise *overheadPressExercise = [[Exercise alloc]initWithName:overheadPress targetSets:5 targetReps:5 picture:overheadPressPicture];
        Exercise *deadliftExercise = [[Exercise alloc]initWithName:deadlift targetSets:1 targetReps:5 picture:deadliftPicture];
        Exercise *pullupsExercise = [[Exercise alloc]initWithName:pullups targetSets:3 targetReps:8 picture:pullupsPicture];
        
        
        _exercises = [NSMutableArray arrayWithObjects:squatExercise, overheadPressExercise, deadliftExercise, pullupsExercise, nil];
        
    }
    return self;
}



@end
