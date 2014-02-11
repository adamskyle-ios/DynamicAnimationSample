//
//  AnimationBehavior.h
//  DynamicAnimationSample
//
//  Created by Kyle Adams on 11-02-14.
//  Copyright (c) 2014 Kyle Adams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationBehavior : UIDynamicBehavior

@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
