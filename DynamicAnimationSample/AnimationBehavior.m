//
//  AnimationBehavior.m
//  DynamicAnimationSample
//
//  Created by Kyle Adams on 11-02-14.
//  Copyright (c) 2014 Kyle Adams. All rights reserved.
//

#import "AnimationBehavior.h"

@implementation AnimationBehavior

- (instancetype)init
{
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collision];
    return self;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1.5;
    }
    return _gravity;
}

- (UICollisionBehavior *)collision
{
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collision;
}

- (void)addItem:(id<UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collision addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
}

@end
