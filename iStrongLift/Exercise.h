//
//  Exercise.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Exercise : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, readwrite) NSInteger targetSets;
@property (nonatomic, readwrite) NSInteger targetReps;
@property (nonatomic, strong) UIImage *picture;

// check to see if the exercise has been completed
@property (nonatomic, assign) BOOL exerciseCompleted;


// An array of the sets that you've completed
@property (nonatomic, retain)  NSMutableArray *sets;

-(id)initWithName:(NSString *)name targetSets:(NSInteger)targetSets targetReps:(NSInteger)targetReps picture:(NSString *)picture;


@end

// variables for main exercise names
static NSString *benchPress = @"Bench";
static NSString *squat = @"Squat";
static NSString *deadlift = @"Deadlift";
static NSString *overheadPress = @"Overhead";
static NSString *barbellRow = @"Row";
static NSString *dips = @"Dips";
static NSString *pullups = @"Pullups";

static NSString *benchPressPicture = @"bench_press";
static NSString *squatPicture = @"barbell_squat";
static NSString *deadliftPicture = @"deadlift";
static NSString *overheadPressPicture = @"barbell_shoulder_press";
static NSString *barbellRowPicture = @"barbell_row";
static NSString *dipsPicture = @"dips";
static NSString *pullupsPicture = @"pullup";

