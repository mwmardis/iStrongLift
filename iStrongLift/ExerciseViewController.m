//
//  ExerciseViewController.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/7/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "ExerciseViewController.h"
#import "Set.h"
#import "Exercise.h"
@interface ExerciseViewController()


@property (weak, nonatomic) IBOutlet UILabel *set1;

@property (weak, nonatomic) IBOutlet UILabel *set2;

@property (weak, nonatomic) IBOutlet UILabel *set3;

@property (weak, nonatomic) IBOutlet UILabel *set4;

@property (weak, nonatomic) IBOutlet UILabel *set5;




// the text fields representing the weight

@property (weak, nonatomic) IBOutlet UITextField *weight1;

@property (weak, nonatomic) IBOutlet UITextField *weight2;

@property (weak, nonatomic) IBOutlet UITextField *weight3;

@property (weak, nonatomic) IBOutlet UITextField *weight4;

@property (weak, nonatomic) IBOutlet UITextField *weight5;

@property (weak, nonatomic) IBOutlet UITextField *reps1;

@property (weak, nonatomic) IBOutlet UITextField *reps2;

@property (weak, nonatomic) IBOutlet UITextField *reps3;

@property (weak, nonatomic) IBOutlet UITextField *reps4;

@property (weak, nonatomic) IBOutlet UITextField *reps5;

@property (weak, nonatomic) IBOutlet UIStepper *stepper1;

@property (weak, nonatomic) IBOutlet UIStepper *stepper2;

@property (weak, nonatomic) IBOutlet UIStepper *stepper3;

@property (weak, nonatomic) IBOutlet UIStepper *stepper4;

@property (weak, nonatomic) IBOutlet UIStepper *stepper5;


@property (weak, nonatomic) IBOutlet UIButton *completeExercise;


// array that will hold up to 15 that will represent how many reps are completed
@property (strong, nonatomic) NSArray *repArray;


@property (nonatomic, readwrite) NSInteger recLift;

// the weights when/if they are changed from the recLift
@property (nonatomic, readwrite) NSInteger realWeight1;
@property (nonatomic, readwrite) NSInteger realWeight2;
@property (nonatomic, readwrite) NSInteger realWeight3;
@property (nonatomic, readwrite) NSInteger realWeight4;
@property (nonatomic, readwrite) NSInteger realWeight5;

// the reps when/if they are changed from the reclift
@property (nonatomic, readwrite) NSInteger realRep1;
@property (nonatomic, readwrite) NSInteger realRep2;
@property (nonatomic, readwrite) NSInteger realRep3;
@property (nonatomic, readwrite) NSInteger realRep4;
@property (nonatomic, readwrite) NSInteger realRep5;
@end

@implementation ExerciseViewController

- (NSArray *)repArray
{
    if (!_repArray) {
        _repArray = [[NSArray alloc] init];
    }
    return _repArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.repArray = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15];
    [self.tabBarController setTitle:self.exercise.name];
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.recLift = [defaults integerForKey:self.exercise.name];
    
    _weight1.delegate = self;
    _weight2.delegate = self;
    _weight3.delegate = self;
    _weight4.delegate = self;
    _weight5.delegate = self;
    
    _reps1.delegate = self;
    _reps2.delegate = self;
    _reps3.delegate = self;
    _reps4.delegate = self;
    _reps5.delegate = self;
    
    // set weight information
    self.weight1.text = [NSString stringWithFormat:@"%ld", self.recLift];
    self.weight2.text = [NSString stringWithFormat:@"%ld", self.recLift];
    self.weight3.text = [NSString stringWithFormat:@"%ld", self.recLift];
    self.weight4.text = [NSString stringWithFormat:@"%ld", self.recLift];
    self.weight5.text = [NSString stringWithFormat:@"%ld", self.recLift];
    
    self.realWeight1 = self.recLift;
    self.realWeight2 = self.recLift;
    self.realWeight3 = self.recLift;
    self.realWeight4 = self.recLift;
    self.realWeight5 = self.recLift;
    
    self.realRep1 = self.exercise.targetReps;
    self.realRep2 = self.exercise.targetReps;
    self.realRep3 = self.exercise.targetReps;
    self.realRep4 = self.exercise.targetReps;
    self.realRep5 = self.exercise.targetReps;
    
    
    [self.weight1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.weight2 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.weight3 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.weight4 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.weight5 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.reps1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.reps2 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.reps3 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.reps4 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.reps5 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    // set initial stepper information
    [self.stepper1 setValue:self.recLift];
    [self.stepper2 setValue:self.recLift];
    [self.stepper3 setValue:self.recLift];
    [self.stepper4 setValue:self.recLift];
    [self.stepper5 setValue:self.recLift];
    
    // set the initial rep information
    self.reps1.text = [NSString stringWithFormat:@"%ld", self.exercise.targetReps];
    self.reps2.text = [NSString stringWithFormat:@"%ld", self.exercise.targetReps];
    self.reps3.text = [NSString stringWithFormat:@"%ld", self.exercise.targetReps];
    self.reps4.text = [NSString stringWithFormat:@"%ld", self.exercise.targetReps];
    self.reps5.text = [NSString stringWithFormat:@"%ld", self.exercise.targetReps];
    
    
    // adjust the complete exercise button depending on the exercise
    if ([self.exercise.name isEqualToString:deadlift]) {
        CGRect btFrame = self.completeExercise.frame;
        btFrame.origin.x = 90;
        btFrame.origin.y = 220;
        [self.completeExercise setTranslatesAutoresizingMaskIntoConstraints:YES];
        self.completeExercise.frame = btFrame;
        
    }
    
    if ([self.exercise.name isEqualToString:dips] || [self.exercise.name isEqualToString:pullups]) {
        CGRect btFrame = self.completeExercise.frame;
        btFrame.origin.x = 90;
        btFrame.origin.y = 400;
        [self.completeExercise setTranslatesAutoresizingMaskIntoConstraints:YES];
        self.completeExercise.frame = btFrame;
    }
    
    
    
    // make the UI adjust accordingly so depending on the exercise
    if ([self.exercise.name isEqualToString:deadlift]) {
        self.set2.hidden = YES;
        self.set3.hidden = YES;
        self.set4.hidden = YES;
        self.set5.hidden = YES;
        
        self.weight2.hidden = YES;
        self.weight3.hidden = YES;
        self.weight4.hidden = YES;
        self.weight5.hidden = YES;
        
        self.stepper2.hidden = YES;
        self.stepper3.hidden = YES;
        self.stepper4.hidden = YES;
        self.stepper5.hidden = YES;
        
        self.reps2.hidden = YES;
        self.reps3.hidden = YES;
        self.reps4.hidden = YES;
        self.reps5.hidden = YES;
        
        
        
    }
    if ([self.exercise.name isEqualToString:dips] || [self.exercise.name isEqualToString:pullups]) {
        
        self.set4.hidden = YES;
        self.set5.hidden = YES;
        
        self.weight4.hidden = YES;
        self.weight5.hidden = YES;
        
        self.stepper4.hidden = YES;
        self.stepper5.hidden = YES;
        
        self.reps4.hidden = YES;
        self.reps5.hidden = YES;
    }
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tabBarController setTitle:self.exercise.name];
    self.tabBarController.navigationItem.hidesBackButton=NO;
}


-(void)textFieldDidChange :(UITextField *)theTextField{
    if ([theTextField isEqual:self.weight1]) {
        self.realWeight1 = [self.weight1.text intValue];
        [self.stepper1 setValue:self.realWeight1];
    }
    if ([theTextField isEqual:self.weight2]) {
        self.realWeight2 = [self.weight2.text intValue];
        [self.stepper2 setValue:self.realWeight2];
    }
    if ([theTextField isEqual:self.weight3]) {
        self.realWeight3 = [self.weight3.text intValue];
        [self.stepper3 setValue:self.realWeight3];
    }
    if ([theTextField isEqual:self.weight4]) {
        self.realWeight4 = [self.weight4.text intValue];
        [self.stepper4 setValue:self.realWeight4];
    }
    if ([theTextField isEqual:self.weight5]) {
        self.realWeight5 = [self.weight5.text intValue];
        [self.stepper5 setValue:self.realWeight5];
    }
    
    if ([theTextField isEqual:self.reps1]) {
        self.realRep1 = [self.reps1.text intValue];
        
    }
    if ([theTextField isEqual:self.reps2]) {
        self.realRep2 = [self.reps2.text intValue];
        
    }
    if ([theTextField isEqual:self.reps3]) {
        self.realRep3 = [self.reps3.text intValue];
        
    }
    if ([theTextField isEqual:self.reps4]) {
        self.realRep4 = [self.reps4.text intValue];
        
    }
    if ([theTextField isEqual:self.reps5]) {
        self.realRep5 = [self.reps5.text intValue];
        
    }
    
}



//actions to update the stepper and text fields when the steppers are incremented/decremented
- (IBAction)stepper1:(id)sender {
    self.realWeight1 = [self.stepper1 value];
    self.weight1.text = [NSString stringWithFormat: @"%ld", self.realWeight1];
    
}

- (IBAction)stepper2:(id)sender {
    self.realWeight2 = [self.stepper2 value];
    self.weight2.text = [NSString stringWithFormat: @"%ld", self.realWeight2];
}

- (IBAction)stepper3:(id)sender {
    self.realWeight3 = [self.stepper3 value];
    self.weight3.text = [NSString stringWithFormat: @"%ld", self.realWeight3];
}

- (IBAction)stepper4:(id)sender {
    self.realWeight4 = [self.stepper4 value];
    self.weight4.text = [NSString stringWithFormat: @"%ld", self.realWeight4];
}

- (IBAction)stepper5:(id)sender {
    self.realWeight5 = [self.stepper5 value];
    self.weight5.text = [NSString stringWithFormat: @"%ld", self.realWeight5];
}


- (IBAction)tapToDismiss:(UITapGestureRecognizer *)sender {
    [self.weight1 resignFirstResponder];
    [self.weight2 resignFirstResponder];
    [self.weight3 resignFirstResponder];
    [self.weight4 resignFirstResponder];
    [self.weight5 resignFirstResponder];
    
    [self.reps1 resignFirstResponder];
    [self.reps2 resignFirstResponder];
    [self.reps3 resignFirstResponder];
    [self.reps4 resignFirstResponder];
    [self.reps5 resignFirstResponder];
    
}



// segues to previous page and checks to see if weight/reps are completed to move up in weight
- (IBAction)completeExercise:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    // the case for when the exercise is deadlift
    if ([self.exercise.name isEqualToString:deadlift]) {
        if ((self.realWeight1 >= self.recLift) && (self.realRep1 >= self.exercise.targetReps)) {
            // set the recommended lift to the smallest weight that they lifted over it and increment by 5
            NSInteger min = self.realWeight1;
            
            [defaults setInteger:min + 5 forKey:self.exercise.name];
            [[[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"We will increment the amount of weight that you lift next time!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            
            
        }
        else {
            [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        }
        
    }
    else if ([self.exercise.name isEqualToString:pullups] || [self.exercise.name isEqualToString:dips]) {
        if ((self.realWeight1 >= self.recLift) && (self.realRep1 >= self.exercise.targetReps)) {
            if ((self.realWeight2 >= self.recLift) && (self.realRep2 >= self.exercise.targetReps)) {
                if ((self.realWeight3 >= self.recLift) && (self.realRep3 >= self.exercise.targetReps)) {
                    
                    // set the recommended lift to the smallest weight that they lifted over it and increment by 5
                    NSInteger min = MIN(self.realWeight1, MIN(self.realWeight2, self.realWeight3));
                    
                    [defaults setInteger:min + 5 forKey:self.exercise.name];
                    [[[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"We will increment the amount of weight that you lift next time!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                    
                    
                }
                else {
                    [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                }
                
                
            }
            else {
                [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            }
        }
        else {
            [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        }
        
    }

    else {
        
    
        if ((self.realWeight1 >= self.recLift) && (self.realRep1 >= self.exercise.targetReps)) {
            if ((self.realWeight2 >= self.recLift) && (self.realRep2 >= self.exercise.targetReps)) {
                if ((self.realWeight3 >= self.recLift) && (self.realRep3 >= self.exercise.targetReps)) {
                    if ((self.realWeight4 >= self.recLift) && (self.realRep4 >= self.exercise.targetReps)) {
                        if ((self.realWeight5 >= self.recLift) && (self.realRep5 >= self.exercise.targetReps)) {
                            
                            // set the recommended lift to the smallest weight that they lifted over it and increment by 5
                            NSInteger min = MIN(self.realWeight1, MIN(self.realWeight2, MIN(self.realWeight3, MIN(self.realWeight4, self.realWeight5))));
                            
                            [defaults setInteger:min + 5 forKey:self.exercise.name];
                            [[[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"We will increment the amount of weight that you lift next time!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                            
                            
                        }
                        else {
                            [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                        }
                    }
                    else {
                        [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                    }
                }
                else {
                    [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                }
            }
            else {
                [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            }
        }
    
        else {
            [[[UIAlertView alloc] initWithTitle:@"You'll get it!" message:@"We'll keep the weights where they are until you are able to complete all of the recommended reps and weights." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        }
    }
    // back to workout page.
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];
    

}



























@end