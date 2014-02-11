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
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) AnimationBehavior *animationBehavior;

@end

@implementation ViewController

static const CGSize VIEW_SIZE = {50, 50};

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

- (UICollisionBehavior *)collision
{
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        [_collision addBoundaryWithIdentifier:@"collisionMidScreen" fromPoint:CGPointMake(0, self.view.center.y + VIEW_SIZE.width) toPoint:CGPointMake(self.view.frame.size.width, self.view.center.y + VIEW_SIZE.width)];
        _collision.collisionMode = UICollisionBehaviorModeEverything;
        _collision.translatesReferenceBoundsIntoBoundary =YES; 
    }
    return _collision;
}

- (IBAction)bounceButton:(UIButton *)sender
{
    [self createBounceView];
}

- (void)createBounceView
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = VIEW_SIZE;
    int x = (arc4random()%(int)self.view.bounds.size.width) / VIEW_SIZE.width;
    frame.origin.x = x * VIEW_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [UIColor randomFlatColor];
    [self.view addSubview:dropView];
    
    [self.animationBehavior addItem:dropView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
