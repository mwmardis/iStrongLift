//
//  DetailLogViewController.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/11/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "DetailLogViewController.h"
#import "Set.h"
@interface DetailLogViewController()

@property (weak, nonatomic) IBOutlet UILabel *exerciseName1;

@property (weak, nonatomic) IBOutlet UILabel *exerciseName2;

@property (weak, nonatomic) IBOutlet UILabel *exerciseName3;

@property (weak, nonatomic) IBOutlet UILabel *exerciseName4;

@property (weak, nonatomic) IBOutlet UILabel *ex1Set1InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex1Set2InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex1Set3InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex1Set4InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex1Set5InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex2Set1InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex2Set2InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex2Set3InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex2Set4InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex2Set5InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex3Set1InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex3Set2InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex3Set3InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex3Set4InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex3Set5InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex4Set1InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex4Set2InfoText;

@property (weak, nonatomic) IBOutlet UILabel *ex4Set3InfoText;


















@end

@implementation DetailLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the title of navigation bar to the date the workout was completed
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate: self.workout.date];
    self.navigationItem.title = stringFromDate;
    
    Exercise *exercise4 = [[Exercise alloc]init];
    
    Exercise *exercise1 = [self.workout.exercises objectAtIndex:0];
    Exercise *exercise2 = [self.workout.exercises objectAtIndex:1];
    Exercise *exercise3 = [self.workout.exercises objectAtIndex:2];
    
    if (self.workout.exercises.count == 4) {
        exercise4 = [self.workout.exercises objectAtIndex:3];
    }
    
    self.exerciseName1.text = exercise1.name;
    self.exerciseName2.text = exercise2.name;
    self.exerciseName3.text = exercise3.name;
    
    if (self.workout.exercises.count == 4) {
         self.exerciseName4.text = exercise4.name;
    }
    else {
        //self.exerciseInfo4.hidden = YES;
        self.exerciseName4.hidden = YES;
    }
    
    // get all of the sets to display the data
    if ([exercise1.sets count] != 0){
        Set *exercise1Set1 = [exercise1.sets objectAtIndex:0];
        Set *exercise1Set2 = [exercise1.sets objectAtIndex:1];
        Set *exercise1Set3 = [exercise1.sets objectAtIndex:2];
        Set *exercise1Set4 = [exercise1.sets objectAtIndex:3];
        Set *exercise1Set5 = [exercise1.sets objectAtIndex:4];
        NSString *set1Weight = [NSString stringWithFormat:@"%ld", (long)exercise1Set1.weight];
        NSString *set2Weight = [NSString stringWithFormat:@"%ld", (long)exercise1Set2.weight];
        NSString *set3Weight = [NSString stringWithFormat:@"%ld", (long)exercise1Set3.weight];
        NSString *set4Weight = [NSString stringWithFormat:@"%ld", (long)exercise1Set4.weight];
        NSString *set5Weight = [NSString stringWithFormat:@"%ld", (long)exercise1Set5.weight];
        NSString *set1Reps = [NSString stringWithFormat:@"%ld", (long)exercise1Set1.reps];
        NSString *set2Reps = [NSString stringWithFormat:@"%ld", (long)exercise1Set2.reps];
        NSString *set3Reps = [NSString stringWithFormat:@"%ld", (long)exercise1Set3.reps];
        NSString *set4Reps = [NSString stringWithFormat:@"%ld", (long)exercise1Set4.reps];
        NSString *set5Reps = [NSString stringWithFormat:@"%ld", (long)exercise1Set5.reps];
        
        NSArray *joinString1 =  [NSArray arrayWithObjects:set1Weight, set1Reps, nil];
         NSArray *joinString2 = [NSArray arrayWithObjects:set2Weight, set2Reps, nil];
         NSArray *joinString3 = [NSArray arrayWithObjects:set3Weight, set3Reps, nil];
         NSArray *joinString4 = [NSArray arrayWithObjects:set4Weight, set4Reps, nil];
         NSArray *joinString5 = [NSArray arrayWithObjects:set5Weight, set5Reps, nil];
        
        self.ex1Set1InfoText.text = [joinString1 componentsJoinedByString:@" x "];
        self.ex1Set2InfoText.text = [joinString2 componentsJoinedByString:@" x "];
        self.ex1Set3InfoText.text = [joinString3 componentsJoinedByString:@" x "];
        self.ex1Set4InfoText.text = [joinString4 componentsJoinedByString:@" x "];
        self.ex1Set5InfoText.text = [joinString5 componentsJoinedByString:@" x "];
        
        
        
    }
    else {
        self.ex1Set1InfoText.hidden = YES;
        self.ex1Set2InfoText.hidden = YES;
        self.ex1Set4InfoText.hidden = YES;
        self.ex1Set5InfoText.hidden = YES;
        
        self.ex1Set3InfoText.text = @"Incomplete";
    }
    
    if ([exercise2.sets count] != 0){
        Set *exercise2Set1 = [exercise2.sets objectAtIndex:0];
        Set *exercise2Set2 = [exercise2.sets objectAtIndex:1];
        Set *exercise2Set3 = [exercise2.sets objectAtIndex:2];
        Set *exercise2Set4 = [exercise2.sets objectAtIndex:3];
        Set *exercise2Set5 = [exercise2.sets objectAtIndex:4];
        
        NSString *set1Weight = [NSString stringWithFormat:@"%ld", (long)exercise2Set1.weight];
        NSString *set2Weight = [NSString stringWithFormat:@"%ld", (long)exercise2Set2.weight];
        NSString *set3Weight = [NSString stringWithFormat:@"%ld", (long)exercise2Set3.weight];
        NSString *set4Weight = [NSString stringWithFormat:@"%ld", (long)exercise2Set4.weight];
        NSString *set5Weight = [NSString stringWithFormat:@"%ld", (long)exercise2Set5.weight];
        NSString *set1Reps = [NSString stringWithFormat:@"%ld", (long)exercise2Set1.reps];
        NSString *set2Reps = [NSString stringWithFormat:@"%ld", (long)exercise2Set2.reps];
        NSString *set3Reps = [NSString stringWithFormat:@"%ld", (long)exercise2Set3.reps];
        NSString *set4Reps = [NSString stringWithFormat:@"%ld", (long)exercise2Set4.reps];
        NSString *set5Reps = [NSString stringWithFormat:@"%ld", (long)exercise2Set5.reps];
        
        NSArray *joinString1 =  [NSArray arrayWithObjects:set1Weight, set1Reps, nil];
        NSArray *joinString2 = [NSArray arrayWithObjects:set2Weight, set2Reps, nil];
        NSArray *joinString3 = [NSArray arrayWithObjects:set3Weight, set3Reps, nil];
        NSArray *joinString4 = [NSArray arrayWithObjects:set4Weight, set4Reps, nil];
        NSArray *joinString5 = [NSArray arrayWithObjects:set5Weight, set5Reps, nil];
        
        self.ex2Set1InfoText.text = [joinString1 componentsJoinedByString:@" x "];
        self.ex2Set2InfoText.text = [joinString2 componentsJoinedByString:@" x "];
        self.ex2Set3InfoText.text = [joinString3 componentsJoinedByString:@" x "];
        self.ex2Set4InfoText.text = [joinString4 componentsJoinedByString:@" x "];
        self.ex2Set5InfoText.text = [joinString5 componentsJoinedByString:@" x "];
        
        
    }
    else {
        self.ex2Set1InfoText.hidden = YES;
        self.ex2Set2InfoText.hidden = YES;
        self.ex2Set4InfoText.hidden = YES;
        self.ex2Set5InfoText.hidden = YES;
        
        //self.ex2Set3InfoText.frame = CGRectMake(153, 229, 150, 21);
        self.ex2Set3InfoText.text = @"Incomplete";
        
    }
    
    // check to see if it is deadlift or not
    if ([exercise3.sets count] != 0) {
        if ([exercise3.name isEqualToString:deadlift]) {
            Set *exercise3Set1 = [exercise3.sets objectAtIndex:0];
            NSString *set1Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set1.weight];
            NSString *set1Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set1.reps];
            NSArray *joinString1 = [NSArray arrayWithObjects:set1Weight, set1Reps, nil];
            self.ex3Set3InfoText.text = [joinString1 componentsJoinedByString:@" x "];
            self.ex3Set1InfoText.hidden = YES;
            self.ex3Set2InfoText.hidden = YES;
            self.ex3Set4InfoText.hidden = YES;
            self.ex3Set5InfoText.hidden = YES;
            
        }
        //otherwise it is an overhead press
        else {
            Set *exercise3Set1 = [exercise3.sets objectAtIndex:0];
            Set *exercise3Set2 = [exercise3.sets objectAtIndex:1];
            Set *exercise3Set3 = [exercise3.sets objectAtIndex:2];
            Set *exercise3Set4 = [exercise3.sets objectAtIndex:3];
            Set *exercise3Set5 = [exercise3.sets objectAtIndex:4];
            
            NSString *set1Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set1.weight];
            NSString *set2Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set2.weight];
            NSString *set3Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set3.weight];
            NSString *set4Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set4.weight];
            NSString *set5Weight = [NSString stringWithFormat:@"%ld", (long)exercise3Set5.weight];
            NSString *set1Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set1.reps];
            NSString *set2Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set2.reps];
            NSString *set3Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set3.reps];
            NSString *set4Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set4.reps];
            NSString *set5Reps = [NSString stringWithFormat:@"%ld", (long)exercise3Set5.reps];
            
            NSArray *joinString1 =  [NSArray arrayWithObjects:set1Weight, set1Reps, nil];
            NSArray *joinString2 = [NSArray arrayWithObjects:set2Weight, set2Reps, nil];
            NSArray *joinString3 = [NSArray arrayWithObjects:set3Weight, set3Reps, nil];
            NSArray *joinString4 = [NSArray arrayWithObjects:set4Weight, set4Reps, nil];
            NSArray *joinString5 = [NSArray arrayWithObjects:set5Weight, set5Reps, nil];
            
            self.ex3Set1InfoText.text = [joinString1 componentsJoinedByString:@" x "];
            self.ex3Set2InfoText.text = [joinString2 componentsJoinedByString:@" x "];
            self.ex3Set3InfoText.text = [joinString3 componentsJoinedByString:@" x "];
            self.ex3Set4InfoText.text = [joinString4 componentsJoinedByString:@" x "];
            self.ex3Set5InfoText.text = [joinString5 componentsJoinedByString:@" x "];
        }
    }
    else {
        self.ex3Set1InfoText.hidden = YES;
        self.ex3Set2InfoText.hidden = YES;
        self.ex3Set4InfoText.hidden = YES;
        self.ex3Set5InfoText.hidden = YES;
        
        //self.ex2Set3InfoText.frame = CGRectMake(153, 229, 150, 21);
        self.ex3Set3InfoText.text = @"Incomplete";
    }
    
    
    // check to see if the accessory exercises are enabled
    if (self.workout.exercises.count == 4) {
        if ([exercise4.sets count] != 0){
            Set *exercise4Set1 = [exercise4.sets objectAtIndex:0];
            Set *exercise4Set2 = [exercise4.sets objectAtIndex:1];
            Set *exercise4Set3 = [exercise4.sets objectAtIndex:2];
            
            
            NSString *set1Weight = [NSString stringWithFormat:@"%ld", (long)exercise4Set1.weight];
            NSString *set2Weight = [NSString stringWithFormat:@"%ld", (long)exercise4Set2.weight];
            NSString *set3Weight = [NSString stringWithFormat:@"%ld", (long)exercise4Set3.weight];
            
            NSString *set1Reps = [NSString stringWithFormat:@"%ld", (long)exercise4Set1.reps];
            NSString *set2Reps = [NSString stringWithFormat:@"%ld", (long)exercise4Set2.reps];
            NSString *set3Reps = [NSString stringWithFormat:@"%ld", (long)exercise4Set3.reps];
            
            NSArray *joinString1 =  [NSArray arrayWithObjects:set1Weight, set1Reps, nil];
            NSArray *joinString2 = [NSArray arrayWithObjects:set2Weight, set2Reps, nil];
            NSArray *joinString3 = [NSArray arrayWithObjects:set3Weight, set3Reps, nil];
            
            self.ex4Set1InfoText.text = [joinString1 componentsJoinedByString:@" x "];
            self.ex4Set2InfoText.text = [joinString2 componentsJoinedByString:@" x "];
            self.ex4Set3InfoText.text = [joinString3 componentsJoinedByString:@" x "];
            
            
        }
        else {
            self.ex4Set1InfoText.hidden = YES;
            self.ex4Set3InfoText.hidden = YES;
            
            self.ex4Set2InfoText.hidden = YES;
        }
    }
    else {
        self.exerciseName4.hidden = YES;
        self.ex4Set1InfoText.hidden = YES;
        self.ex4Set2InfoText.hidden = YES;
        self.ex4Set3InfoText.hidden = YES;
    }
    
    
    
}
























@end
