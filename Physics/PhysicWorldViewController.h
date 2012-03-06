//
//  PhysicWorldViewController.h
//  Physics
//
//  Created by Eduardo Irias on 05/03/12.
//  Copyright (c) 2012 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhysicsWorld.h"
#import "movingObject.h"
@interface PhysicWorldViewController : UIViewController

@property (nonatomic, retain) IBOutlet PhysicsWorld *myPhysicsWorld;
@property (nonatomic, retain) IBOutlet movingObject *myPig;
@property (nonatomic, retain) IBOutlet movingObject *floor;


@end
