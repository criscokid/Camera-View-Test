//
//  LGLCameraView.m
//  ViewTest
//
//  Created by Ryan Farnell on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LGLCameraView.h"

@implementation LGLCameraView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIImage *image = [UIImage imageNamed:@"cameraimage.jpeg"];
        CGRect imageFrame = CGRectMake(11, 60, frame.size.width - 12 - 42, frame.size.height - 60 - 12);
        _imageView = [[UIImageView alloc] initWithFrame:imageFrame];
        _imageView.image = image;
        [self addSubview:_imageView];
        image = [UIImage imageNamed:@"star.png"];
        CGRect starFrame = CGRectMake(frame.size.width - 30, frame.size.height - 30, 20, 20);
        _starImage = [[UIImageView alloc] initWithFrame:starFrame];
        _starImage.image = image;
        [self addSubview:_starImage];
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        self.alpha = 0;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10.0];
    [[UIColor colorWithWhite:0.0 alpha:0.75] setFill];
    [path fill];
    
    CGRect imageFrame = _imageView.frame;
    CGRect borderFrame = CGRectMake(imageFrame.origin.x - 2, imageFrame.origin.y - 2, imageFrame.size.width + 4, imageFrame.size.height + 4);
    path = [UIBezierPath bezierPathWithRect:borderFrame];
    [path setLineWidth:2.0];
    [[UIColor colorWithWhite:1.0 alpha:1.0] setStroke];
    [path stroke];
    
    [[UIColor colorWithWhite:1.0 alpha:1.0] setFill];
    NSString *mainRoad = @"Ambassador";
    CGPoint mainLabelPoint = CGPointMake(10, 10);
    UIFont *mainLabelFont = [UIFont boldSystemFontOfSize:17.0];
    CGSize mainLabelSize = [mainRoad sizeWithFont:mainLabelFont];                  
    [mainRoad drawAtPoint:mainLabelPoint withFont:mainLabelFont];
    
    UIFont *subLabelFont = [UIFont systemFontOfSize:15.0];
    CGPoint subLabelPoint = CGPointMake(10, mainLabelSize.height + 10);
    NSString *crossroad = @"Eraste Landry";
    [crossroad drawAtPoint:subLabelPoint withFont:subLabelFont];
}


@end
