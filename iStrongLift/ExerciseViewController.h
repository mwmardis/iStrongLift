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

@interface ExerciseViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) Exercise *exercise;

@end
