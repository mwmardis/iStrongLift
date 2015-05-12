//
//  Set.m
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import "Set.h"

@implementation Set
- (void) encodeWithCoder : (NSCoder *)coder
{
    
    [coder encodeInteger: self.reps forKey:@"reps"];
    [coder encodeInteger: self.weight forKey:@"weight"];

    
    
}
- (id) initWithCoder : (NSCoder *)coder
{
    self = [super init];
    if (self != nil)
    {
        self.reps = [coder decodeIntegerForKey:@"reps"];
        self.weight = [coder decodeIntegerForKey:@"weight"];
    }
    return self;
}
@end
