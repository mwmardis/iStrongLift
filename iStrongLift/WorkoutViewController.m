//
//  WorkoutViewController.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "WorkoutViewController.h"
#import "Workout.h"
#import "Log.h"
#import "ExerciseViewController.h"
@implementation WorkoutViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.workout.name;
    
    // make the images in the table positioned like we want
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentInset = UIEdgeInsetsMake(0, -15, 0, 0);
    
    
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Finish" style:UIBarButtonItemStylePlain target:self action:@selector(finish:)];
}

-(void)finish:(UIBarButtonItem *)sender{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.workout.name forKey:PREVIOUS_WORKOUT_COMPLETED];
    self.workout.date = [NSDate date];
    
    //add new log
    Log *newLog = [[Log alloc] initWithWorkout:self.workout];
    NSMutableArray *logs = [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"logs"]];
    [logs insertObject:newLog atIndex:0];
    [defaults setObject:logs forKey:@"logs"];
    
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
    
}

// gives the amount of Exercises that are in a workout program
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workout.exercises.count;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.workout.exercises.count == 3) {
        return 203;
    }
    else if (self.workout.exercises.count == 4) {
        return 151;
    }
    return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"exerciseIdentifier"];
    }
    
    Exercise *exercise = [self.workout.exercises objectAtIndex:indexPath.row];
    
    // user user defualt to get recommended weight to lift
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger recommendedWeight = [defaults integerForKey:exercise.name];
    
    
    NSString *exerciseName = exercise.name;
    
    // get sets and reps for each exercise to display
    NSString *sets = [NSString stringWithFormat:@"%ld", (long)exercise.targetSets];
    NSString *reps = [NSString stringWithFormat:@"%ld", (long)exercise.targetReps];
    NSArray *joinStrings = [NSArray arrayWithObjects:sets, reps, nil];
    
    NSString *jointStrings = [joinStrings componentsJoinedByString:@" x "];
    NSString *between = @"at";
    NSString *recWeightString = [[NSString alloc]initWithFormat:@"%ld", (long)recommendedWeight];
    NSString *lbs = @"lbs";
    
    NSArray *doneArray;
    if (recommendedWeight) {
        doneArray = [NSArray arrayWithObjects:jointStrings, between, recWeightString, lbs, nil];
    }
    else {
        doneArray =[NSArray arrayWithObjects:jointStrings, between, @"body weight", nil];
    }
    
    
    NSString *finallyDone = [doneArray componentsJoinedByString:@" "];
    
    
    cell.textLabel.text = exerciseName;
    cell.detailTextLabel.text = finallyDone;
    
    cell.imageView.image = exercise.picture;
    
    // change the dimensions of the pictures based on how many exercises there are. Found on stack overflow.
    CGSize itemSize = CGSizeMake(151, 151);
    if (self.workout.exercises.count == 3) {
        itemSize = CGSizeMake(203, 203);
    }
    if (self.workout.exercises.count == 4) {
        itemSize = CGSizeMake(150, 150);
    }
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Exercise *exercise = [self.workout.exercises objectAtIndex:indexPath.row];
    
    if([segue.identifier isEqualToString:@"workouttoexercise"])
    {
        UITabBarController *tabar=segue.destinationViewController;
        ExerciseViewController *vc=[tabar.viewControllers objectAtIndex:0];
        vc.exercise = exercise;
        
        //vc.workoutProgram = self.workoutProgram;
        
        
    }
    
}











@end
