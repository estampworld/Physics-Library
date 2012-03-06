//
//  PhysicsWorld.h
//  Physics
//
//  Created by Eduardo Irias on 05/03/12.
//  Copyright (c) 2012 Estamp World. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "movingObject.h"

@interface PhysicsWorld : UIView

@property (nonatomic) CGPoint gravity;
@property (nonatomic) NSInteger gameState;
@property (nonatomic) NSInteger previousState;
@property (nonatomic, retain) NSMutableArray *worldObjects;

- (void) StartWorld;
- (void)worldLoop;
- (void)gameStatePlayNormal;
- (void)addObject:(movingObject*)object;

@end
