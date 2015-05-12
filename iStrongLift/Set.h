//
//  Set.h
//  iStrongLift
//
//  Created by Michael Mardis on 5/6/15.
//  Copyright (c) 2015 CS378. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Set : NSObject

@property (nonatomic, readwrite) NSInteger weight;
@property (nonatomic, readwrite) NSInteger reps;
- (void) encodeWithCoder : (NSCoder *)encode ;
- (id) initWithCoder : (NSCoder *)decode;
@end
