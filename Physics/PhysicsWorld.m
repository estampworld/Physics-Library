//
//  PhysicsWorld.m
//  Physics
//
//  Created by Eduardo Irias on 05/03/12.
//  Copyright (c) 2012 Estamp World. All rights reserved.
//

#import "PhysicsWorld.h"


#define StateRunning 1
#define StatePause 2
#define StateReset 3

#define MaxSpeed 10

#define Gravity 0.095

@implementation PhysicsWorld

@synthesize gravity, gameState, previousState, worldObjects;

- (void) StartWorld {
    gravity = CGPointMake(0, Gravity);
    
    worldObjects = [[NSMutableArray alloc] init];
    gameState = StateRunning;
    previousState = StateReset;
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(worldLoop) userInfo:nil repeats:YES];
}

- (void)addObject:(movingObject*)object {
    if (worldObjects!=Nil) {
        [worldObjects addObject:object];
    }
}

- (void)worldLoop {
	// Running
    
	if (gameState == StateRunning) {
		if (previousState != StateRunning) {
			
		}
		
		[self gameStatePlayNormal];
		previousState = StateRunning;
	}
    //Pause 
    else if (gameState == StatePause) {		
		previousState = StatePause;
	}
	// Game Over
	else if (gameState == StateReset) {
		if (previousState == StateRunning) {
            //Reset All
            
		}
		
		previousState = StateReset;
	}
	
}

- (void)gameStatePlayNormal {
    for (movingObject *objs in worldObjects) {
        if (objs.objectType == 1) {
            CGPoint tmpVel = objs.Velocity;
            tmpVel.y += gravity.y;
            objs.Velocity = tmpVel;
        }
        
    }    
	
	
	// Make sure the Objects doesn't move fast.
    for (movingObject *objs in worldObjects) {
        if (objs.objectType == 1) {
            if (objs.Velocity.x > MaxSpeed) {
                CGPoint tmpVel = objs.Velocity;
                tmpVel.x = MaxSpeed;
                objs.Velocity = tmpVel;
            }
            if (objs.Velocity.x < -MaxSpeed) {
                CGPoint tmpVel = objs.Velocity;
                tmpVel.x = - MaxSpeed;
                objs.Velocity = tmpVel;
            }
        }
	}
    
    for (movingObject *objs in worldObjects) {
        if (objs.objectType == 1) {
            objs.center = CGPointMake(objs.center.x + objs.Velocity.x, objs.center.y + objs.Velocity.y);
        }
    } 
	
    
    // Check for a bounce
    for (movingObject *dynobjs in worldObjects) {
        for (movingObject *staobjs in worldObjects) {
            if (dynobjs.objectType == 1 && staobjs.objectType == 2) {
                if (CGRectIntersectsRect(dynobjs.frame, staobjs.frame)) {
                    if (dynobjs.center.y - 28 < staobjs.center.y) {
                        CGPoint tmpVel = dynobjs.Velocity;
                        tmpVel.y =  -1;
                        dynobjs.Velocity = tmpVel;                    
                    }
                }
            }
            
        }
    }
	
}

@end
