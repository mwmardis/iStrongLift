//
//  Exercise.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "Exercise.h"
#import <UIKit/UIKit.h>
#import "Set.h"
@implementation Exercise


-(id)initWithName:(NSString *)name targetSets:(NSInteger)targetSets targetReps:(NSInteger)targetReps picture:(NSString *)picture {
    if (self) {
        UIImage *img = [UIImage imageNamed:picture];
        
        _name = name;
        _targetSets = targetSets;
        _targetReps = targetReps;
        _picture = img;
        _exerciseCompleted = NO;
        _sets = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void) encodeWithCoder : (NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"exercise name"];
    [coder encodeObject:self.sets forKey:@"sets"];
    
    
}
- (id) initWithCoder : (NSCoder *)coder
{
    self = [super init];
    if (self != nil)
    {
        self.name = [coder decodeObjectForKey:@"exercise name"];
        self.sets = [coder decodeObjectForKey:@"sets"];
        
    }
    return self;
    
}


@end
