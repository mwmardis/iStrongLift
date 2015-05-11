//
//  ViewController.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/5/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "Workout.h"
#import "WorkoutViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *welcomeText;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.welcomeText.textColor = [UIColor whiteColor];
    //self.welcomeText.textAlignment = NSTextAlignmentCenter;
    //[self.welcomeText setFont:[UIFont systemFontOfSize:22]];
    _welcomeText.textColor = [UIColor whiteColor];
    
    // code that clears NSUserDefaults
    //NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    //[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    // Do any additional setup after loading the view, typically from a nib.
    
     self.navigationItem.hidesBackButton = YES;
    
    // set the color of the UINavigationBar background and text
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed: 51.0/255.0f green:51.0/255.0f blue:51.0/255.0f alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    
    // set the back button to not show text
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    
    // check to see if the user has ever inputted any 1-rep maxes. If not, bug them about it
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults integerForKey:MAX_BENCH]) {
        [[[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Please visit the Settings page to set your 1-rep maxes." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
    }

  
}

-(void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    if ([[defaults objectForKey:PREVIOUS_WORKOUT_COMPLETED] isEqualToString:@"Workout A"] ) {
        self.welcomeText.text = @"You previously completed workout A. We recommend that you do workout B this time";
        self.welcomeText.textColor = [UIColor whiteColor];
        self.welcomeText.textAlignment = NSTextAlignmentCenter;
        [self.welcomeText setFont:[UIFont systemFontOfSize:20]];
        
    }
    else if([[defaults objectForKey:PREVIOUS_WORKOUT_COMPLETED] isEqualToString:@"Workout B"] ) {
        self.welcomeText.text = @"You previously completed workout B. We recommend that you do workout A this time.";
        self.welcomeText.textColor = [UIColor whiteColor];
        self.welcomeText.textAlignment = NSTextAlignmentCenter;
        [self.welcomeText setFont:[UIFont systemFontOfSize:20]];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// sends the selected workout to the workoutViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // user NSUserDefaults to see if dips and pullups are enabled/disabled
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    Workout *workout;
    
    // Set the workout program appropriately on the segued page
    if ([[segue identifier] isEqualToString:@"toA"])
    {
        
        if ([defaults boolForKey:DIPS_ENABLED]) {
            workout = [[Workout alloc]initStrongLiftAExtended];
        }
        else {
            workout = [[Workout alloc]initStrongLiftA];
        }
        
        
        WorkoutViewController *vc = (WorkoutViewController *)segue.destinationViewController;
        
        vc.workout = workout;
    }
    
    else if ([[segue identifier] isEqualToString:@"toB"]) {
        
        if ([defaults boolForKey:PULLUPS_ENABLED]) {
            workout = [[Workout alloc]initStrongLiftBExtended];
        }
        else {
            workout = [[Workout alloc]initStrongLiftB];
        }

        WorkoutViewController *vc = (WorkoutViewController *)segue.destinationViewController;
        vc.workout = workout;
    }
    
    
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"toA"] || [identifier isEqualToString:@"toB"]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults integerForKey:MAX_BENCH]) {
            return YES;
        }
        else {
            [[[UIAlertView alloc] initWithTitle:@"Visit Settings Page" message:@"Please fill in the 1-rep maxes on the settings page so that we can recommend weight to lift." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            
            return NO;
        }
    }
    
    // also add an identifier to give an alert if there haven't been any logs.
    
   
    return YES;
}

@end
