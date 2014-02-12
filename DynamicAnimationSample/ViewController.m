//
//  ViewController.m
//  DynamicAnimationSample
//
//  Created by Kyle Adams on 11-02-14.
//  Copyright (c) 2014 Kyle Adams. All rights reserved.
//

#import "ViewController.h"
#import "AnimationBehavior.h"
#import "UIColor+FlatColors.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) AnimationBehavior *animationBehavior;
@property (nonatomic) BOOL fallen;

@end

@implementation ViewController


static const CGSize VIEW_SIZE = {40, 40};

- (AnimationBehavior *)animationBehavior
{
    if (!_animationBehavior) {
        _animationBehavior = [[AnimationBehavior alloc] init];
        [self.animator addBehavior:_animationBehavior];
    }
    return _animationBehavior;
}

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (IBAction)bounceButton:(UIButton *)sender
{
    if (self.fallen == YES) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        CGPoint begin = CGPointMake(0, screenSize.height / 2);
        CGPoint end = CGPointMake(screenSize.width, screenSize.height / 2);
        [self.animationBehavior.collision addBoundaryWithIdentifier:@"bounceBoundary" fromPoint:begin toPoint:end];
        self.animationBehavior.collision.translatesReferenceBoundsIntoBoundary = YES;
        self.fallen = NO;
        [self createBounceView];
    } else {
        [self createBounceView];

    }
}

- (IBAction)fallButton:(UIButton *)sender
{
    self.animationBehavior.collision.translatesReferenceBoundsIntoBoundary = NO;
    [self.animationBehavior.collision removeAllBoundaries];
    self.fallen = YES;
}

- (void)createBounceView
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = VIEW_SIZE;
    int x = (arc4random()%(int)self.view.bounds.size.width) / VIEW_SIZE.width;
    frame.origin.x = x * VIEW_SIZE.width;
    
    UIView *bounceView = [[UIView alloc] initWithFrame:frame];
    bounceView.backgroundColor = [UIColor randomFlatColor];
    [self.view addSubview:bounceView];
    
    [self.animationBehavior addItem:bounceView];
}

@end
