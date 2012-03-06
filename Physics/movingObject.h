//
//  movingObject.h
//  EW Monsters
//
//  Created by Eduardo Irias on 16/10/11.
//  Copyright (c) 2011 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface movingObject :  UIImageView  

@property (nonatomic) CGPoint Velocity;
@property (nonatomic) int objectType;
@property (nonatomic) float angle;


-(void) prepare;
//-(void) collide;

-(void) move:(int)xl;
-(void) rotateThis;


@end

