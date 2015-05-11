//
//  Log.h
//  iStrongLift
//
//  Created by Juan Vasquez on 5/11/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"
@interface Log : NSObject

-(id) initWithWorkout: (Workout*) workout;
@property (nonatomic, strong)Workout *workout;
@end
