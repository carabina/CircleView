//
//  KMCircleView.h
//  CircleView
//
//  Created by Diana Komolova on 19.10.2016.
//  Copyright © 2016 Programming&Occults. All rights reserved.
//

#import <UIKit/UIKit.h>

/*direction of drawing the path*/
typedef NS_ENUM(NSInteger, direction){
    Clockwise = 1,
    Counterclockwise
};

@interface KMKCircleView : UIView

@property (strong, nonatomic) CAShapeLayer *circle;
@property (strong, nonatomic) UIColor *strokeColor;

/*specify frame and colour*/
- (instancetype) initWithFrame:(CGRect)frame Color: (UIColor *)color;

/*draw the view in a viewcontroller's code specifying direction and radius*/
- (void) drawCircleLayerDirection: (NSInteger)direction Frame: (CGRect)parentFrame Radius: (NSInteger)radius;

@end
