//
//  TimerViewController.m
//  LiftingCoach
//
//  Created by Juan Vasquez on 4/17/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "TimerViewController.h"
//@import AudioToolbox;
#import <AVFoundation/AVFoundation.h>

@interface TimerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIPickerView *minutePicker;
@property (strong, nonatomic) NSArray *times;
@property (strong, nonatomic)NSTimer * countdownTimer;
@property (strong, nonatomic) NSMutableArray *seconds;
@property  long ticks;
@property  long secs;
@property  long mins;
@property BOOL isPaused;

@property (nonatomic, strong) AVAudioPlayer *player;

@end


@implementation TimerViewController
- (IBAction)startPressed:(id)sender {
    if(self.isPaused)
    {
        self.isPaused = NO;
        self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(handleTimerTick) userInfo: nil repeats: YES];
        
        
    }
    
    
}
- (IBAction)stopPressed:(id)sender {
    self.isPaused = YES;
    [self clearTimer];
    
}


-(NSTimer *) countdownTimer
{
    if(!_countdownTimer)
    {
        _countdownTimer = [[NSTimer alloc] init];
    }
    return _countdownTimer;
}

-(void)handleTimerTick
{
    
    if(!self.isPaused)
    {
        if (self.ticks <= 0)
        {
            [self.player play];
            [self clearTimer];
            self.isPaused = YES;
        }
        else
        {
            self.ticks--;
            [self updateLabel];
        }
        
    }
}

-(void) updateLabel
{
    if(self.ticks % 60 < 10)
    {
        NSString *beg = [NSString stringWithFormat:@"%ld:0" ,self.ticks / 60 ];
        NSString *end = [NSString stringWithFormat:@"%ld" ,self.ticks % 60 ];
        
        self.timer.text =[beg stringByAppendingString: end];
    }
    else
        self.timer.text = [NSString stringWithFormat:@"%ld:%ld",
                           self.ticks / 60, self.ticks % 60 ];
}
-(NSMutableArray*)seconds
{
    if(!_seconds)
    {
        _seconds = [[NSMutableArray alloc] init];
    }
    
    return _seconds;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.tabBarController setTitle:@"Timer"];
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"Iphone Sms Original"
                                         withExtension:@"mp3"];
    NSError* error = nil;
    
    // create audio player for alert
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [self.player setDelegate:self];
    [self.player prepareToPlay];
    
    _times = @[@"0", @"1", @"2", @"3", @"4"];
    self.isPaused = YES;
    self.ticks = 0;
    self.secs = 0;
    self.mins = 0;
    self.timer.font=[UIFont fontWithName:@"DBLCDTempBlack" size:55.0];
    for(int i = 0; i <=59; i ++)
    {
        [self.seconds addObject:[NSString stringWithFormat:@"%d", i]];
        
    }
    // Connect data
    self.minutePicker.dataSource = self;
    self.minutePicker.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tabBarController setTitle:@"Timer"];
    self.tabBarController.navigationItem.hidesBackButton=YES;
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title;
    if(component == 0)
    {
        title = self.times[row];
    }
    else
        title = self.seconds[row];
    
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}
// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.times.count;
    }
    else
    {
        return self.seconds.count;
    }
    
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.times[row];
    }
    else
        return self.seconds[row];
    
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self clearTimer];
    self.isPaused = YES;
    
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    if(component == 0)
    {
        self.mins = row ;
    }
    else
    {
        self.secs = row ;
    }
    NSLog(@"Minutes: %ld", self.mins);
    NSLog(@"Seconds: %ld", self.secs);
    self.ticks = self.mins * 60 + self.secs;
    NSLog(@"Ticks: %ld", self.ticks);
    [self updateLabel];
}

-(void) clearTimer
{
    [self.countdownTimer invalidate];
    self.countdownTimer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


