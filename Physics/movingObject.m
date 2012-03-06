//
//  movingObject.m
//  EW Monsters
//
//  Created by Eduardo Irias on 16/10/11.
//  Copyright (c) 2011 Estamp World. All rights reserved.
//

#import "movingObject.h"

#define Dynamic 1
#define Static 2

@implementation movingObject

@synthesize Velocity, objectType, angle;

-(void) prepare {
    
}

-(void) move:(int)xl {
    /*
     CGPoint newCenter = CGPointMake(self.center.x + .5, self.center.y);
    self.center = newCenter;
    
    if (self.center.x > xl+ 100) {
        newCenter = CGPointMake((rand() % 100 * -1) - 20, rand() % 320);
        self.center = newCenter;
    }
    */
}

-(void) rotateThis {
    angle += 0.01;
    self.transform=CGAffineTransformMakeRotation (angle);
}




@end
