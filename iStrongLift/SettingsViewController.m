//
//  SettingsViewController.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/5/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "SettingsViewController.h"
#import "User.h"

@interface SettingsViewController()

@property (weak, nonatomic) IBOutlet UITextField *maxBenchText;

@property (weak, nonatomic) IBOutlet UITextField *maxSquatText;

@property (weak, nonatomic) IBOutlet UITextField *maxDeadliftText;

@property (weak, nonatomic) IBOutlet UITextField *maxOverheadText;

@property (weak, nonatomic) IBOutlet UITextField *maxRowText;

@property (weak, nonatomic) IBOutlet UIStepper *maxBenchStepper;

@property (weak, nonatomic) IBOutlet UIStepper *maxSquatStepper;

@property (weak, nonatomic) IBOutlet UIStepper *maxDeadliftStepper;

@property (weak, nonatomic) IBOutlet UIStepper *maxOverheadStepper;

@property (weak, nonatomic) IBOutlet UIStepper *maxRowStepper;

@property (weak, nonatomic) IBOutlet UISwitch *dipsSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *pullupsSwitch;

@property BOOL dipsEnabled;
@property BOOL pullupsEnabled;


@property (nonatomic, readwrite) NSInteger maxBench;
@property (nonatomic, readwrite) NSInteger maxSquat;
@property (nonatomic, readwrite) NSInteger maxDeadlift;
@property (nonatomic, readwrite) NSInteger maxOverhead;
@property (nonatomic, readwrite) NSInteger maxRow;


@end

@implementation SettingsViewController



-(void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Settings";
    
    // Hide back button to force user to input data
    self.navigationItem.hidesBackButton = YES;
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.maxBench = [defaults integerForKey:MAX_BENCH];
    self.maxSquat = [defaults integerForKey:MAX_SQUAT];
    self.maxDeadlift = [defaults integerForKey:MAX_DEADLIFT];
    self.maxOverhead = [defaults integerForKey:MAX_OVERHEAD];
    self.maxRow = [defaults integerForKey:MAX_ROW];
    self.dipsEnabled = [defaults boolForKey:DIPS_ENABLED];
    self.pullupsEnabled = [defaults boolForKey:PULLUPS_ENABLED];
    
    
    if (self.dipsEnabled) {
        [self.dipsSwitch setOn:YES];
    }
    else {
        [self.dipsSwitch setOn:NO];
    }
    if (self.pullupsEnabled) {
        [self.pullupsSwitch setOn:YES];
    }
    else {
        [self.pullupsSwitch setOn:NO];
    }
    
    _maxBenchText.delegate = self;
    _maxSquatText.delegate = self;
    _maxDeadliftText.delegate = self;
    _maxOverheadText.delegate = self;
    _maxRowText.delegate = self;
    
    if(self.maxBench)
    {
        self.maxBenchText.text = [NSString stringWithFormat: @"%ld", self.maxBench];
    }
    if(self.maxSquat)
    {
        self.maxSquatText.text = [NSString stringWithFormat: @"%ld", self.maxSquat];
    }
    if(self.maxDeadlift)
    {
        self.maxDeadliftText.text = [NSString stringWithFormat: @"%ld", self.maxDeadlift];
    }
    if(self.maxOverhead)
    {
        self.maxOverheadText.text = [NSString stringWithFormat: @"%ld", self.maxOverhead];
    }
    if(self.maxRow)
    {
        self.maxRowText.text = [NSString stringWithFormat: @"%ld", self.maxRow];
    }
    
    [self.maxBenchText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.maxSquatText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.maxDeadliftText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.maxOverheadText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.maxRowText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    // set initial stepper information
    [self.maxBenchStepper setValue:self.maxBench];
    [self.maxSquatStepper setValue:self.maxSquat];
    [self.maxDeadliftStepper setValue:self.maxDeadlift];
    [self.maxOverheadStepper setValue:self.maxOverhead];
    [self.maxRowStepper setValue:self.maxRow];
    
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    if ([theTextField isEqual:self.maxBenchText]) {
        self.maxBench = [self.maxBenchText.text intValue];
        [self.maxBenchStepper setValue:self.maxBench];
    }
    if ([theTextField isEqual:self.maxSquatText]) {
        self.maxSquat = [self.maxSquatText.text intValue];
        [self.maxSquatStepper setValue:self.maxSquat];
    }
    if ([theTextField isEqual:self.maxDeadliftText]) {
        self.maxDeadlift = [self.maxDeadliftText.text intValue];
        [self.maxDeadliftStepper setValue:self.maxDeadlift];
    }
    if ([theTextField isEqual:self.maxOverheadText]) {
        self.maxOverhead = [self.maxOverheadText.text intValue];
        [self.maxOverheadStepper setValue:self.maxOverhead];
    }
    if ([theTextField isEqual:self.maxRowText]) {
        self.maxRow = [self.maxRowText.text intValue];
        [self.maxRowStepper setValue:self.maxRow];
    }
    
}




//actions to update the stepper and text fields when the steppers are incremented/decremented
- (IBAction)maxBenchStepper:(id)sender {
    self.maxBench = [self.maxBenchStepper value];
    self.maxBenchText.text = [NSString stringWithFormat: @"%ld", self.maxBench];
    
}

- (IBAction)maxSquatStepper:(id)sender {
    self.maxSquat = [self.maxSquatStepper value];
    self.maxSquatText.text = [NSString stringWithFormat: @"%ld", self.maxSquat];
}

- (IBAction)maxDeadliftStepper:(id)sender {
    self.maxDeadlift = [self.maxDeadliftStepper value];
    self.maxDeadliftText.text = [NSString stringWithFormat: @"%ld", self.maxDeadlift];
}

- (IBAction)maxOverheadStepper:(id)sender {
    self.maxOverhead = [self.maxOverheadStepper value];
    self.maxOverheadText.text = [NSString stringWithFormat: @"%ld", self.maxOverhead];
}

- (IBAction)maxRowStepper:(id)sender {
    self.maxRow = [self.maxRowStepper value];
    self.maxRowText.text = [NSString stringWithFormat: @"%ld", self.maxRow];
}




- (IBAction)tapToDismiss:(UITapGestureRecognizer *)sender {
    [self.maxBenchText resignFirstResponder];
    [self.maxSquatText resignFirstResponder];
    [self.maxDeadliftText resignFirstResponder];
    [self.maxOverheadText resignFirstResponder];
    [self.maxRowText resignFirstResponder];
}


- (IBAction)dipsEnabled:(id)sender {
    if ([sender isOn]) {
        self.dipsEnabled = YES;
    }
    else {
        self.dipsEnabled = NO;
    }
}

- (IBAction)pullupsEnabled:(id)sender {
    if ([sender isOn]) {
        self.pullupsEnabled = YES;
    }
    else {
        self.pullupsEnabled = NO;
    }
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (self.maxBench && self.maxSquat && self.maxDeadlift && self.maxOverhead && self.maxRow) {
        
        // set user defaults
        [defaults setInteger:self.maxBench forKey:MAX_BENCH];
        [defaults setInteger:self.maxSquat forKey:MAX_SQUAT];
        [defaults setInteger:self.maxDeadlift forKey:MAX_DEADLIFT];
        [defaults setInteger:self.maxOverhead forKey:MAX_OVERHEAD];
        [defaults setInteger:self.maxRow forKey:MAX_ROW];
        
        
        // set the recommended weights to lift given the maxes
        // round down to the nearest 5
        [defaults setInteger:(((self.maxBench / 2) / 5) * 5) forKey:REC_BENCH];
        [defaults setInteger:(((self.maxSquat / 2) / 5) * 5) forKey:REC_SQUAT];
        [defaults setInteger:(((self.maxDeadlift / 2) / 5) * 5) forKey:REC_DEADLIFT];
        [defaults setInteger:(((self.maxOverhead / 2) / 5) * 5) forKey:REC_OVERHEAD];
        [defaults setInteger:(((self.maxRow / 2) / 5) * 5) forKey:REC_ROW];
        
        
        
        [defaults setBool:self.dipsEnabled forKey:DIPS_ENABLED];
        [defaults setBool:self.pullupsEnabled forKey:PULLUPS_ENABLED];
        
        
        [defaults synchronize];
     
    }
    else {
        
        // Alert the user to fill in empty max fields.
        [[[UIAlertView alloc] initWithTitle:@"Empty Fields!" message:@"Please fill in any empty 1-rep max fields. If unsure, give it your best guess!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        
        return NO;
    }
    return YES;
}










@end
