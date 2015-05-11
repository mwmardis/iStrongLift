//
//  ExerciseViewController.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/7/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "User.h"
#import "Set.h"

@interface ExerciseViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) Exercise *exercise;

@property (strong, nonatomic) Set *completedSet1;
@property (strong, nonatomic) Set *completedSet2;
@property (strong, nonatomic) Set *completedSet3;
@property (strong, nonatomic) Set *completedSet4;
@property (strong, nonatomic) Set *completedSet5;


@end
