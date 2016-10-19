//
//  KMCircleView.m
//  CircleView
//
//  Created by Diana Komolova on 19.10.2016.
//  Copyright © 2016 Programming&Occults. All rights reserved.
//

#import "KMCircleView.h"

@implementation KMKCircleView

- (instancetype)initWithFrame:(CGRect)frame Color:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        self.strokeColor = color;
    }
    return self;
}


- (void) drawCircleLayerDirection: (NSInteger)direction Frame: (CGRect)parentFrame Radius: (NSInteger)radius{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.circle = [CAShapeLayer layer];
        int rad = (int)radius;
        switch (direction) {
            case Clockwise:
                self.circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*rad, 2.0*rad)
                                                              cornerRadius:rad].CGPath;
                
                break;
            case Counterclockwise:
                self.circle.path = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*rad, 2.0*rad) cornerRadius:rad] bezierPathByReversingPath].CGPath;
                break;
                
            default:
                break;
        }
        
        self.circle.position = CGPointMake(CGRectGetMidX(parentFrame)-rad,
                                           CGRectGetMidY(parentFrame)-rad);
        
        /* Configure the apperence of the circle */
        self.circle.fillColor = [UIColor clearColor].CGColor;
        self.circle.strokeColor = self.strokeColor.CGColor;
        self.circle.lineWidth = 3;
        
        /* Add to parent layer*/
        [self.layer addSublayer:self.circle];
        
        /* Configure animation */
        CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        drawAnimation.duration = 1.0; // "animate over 10 seconds or so.."
        drawAnimation.repeatCount = 1.0;  // Animate only once..
        
        /* Animate from no part of the stroke being drawn to the entire stroke being drawn*/
        drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
        
        /* Experiment with timing to get the appearence to look the way you want*/
        drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        /* Add the animation to the circle*/
        [self.circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
        
    });
    
    
    
}

@end
