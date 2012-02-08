//
//  LGLViewController.m
//  ViewTest
//
//  Created by Ryan Farnell on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LGLViewController.h"
#import "LGLCameraView.h"

@interface LGLViewController ()
{
    LGLCameraView *_currentCamView;
    BOOL _camViewVisible;
}

@end

@implementation LGLViewController

@synthesize map;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _camViewVisible = NO;
	// Do any additional setup after loading the view, typically from a nib.
    CGRect parentFrame = [self.view frame];
    CGRect frame = CGRectMake(parentFrame.size.width / 2 - 150, parentFrame.size.height /2  - 120, 300, 240);
    _currentCamView = [[LGLCameraView alloc] initWithFrame:frame];

    UITapGestureRecognizer *mapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapViewTapped:)];

    [self.map addGestureRecognizer:mapRecognizer];
    [self.view addSubview:_currentCamView];
}

- (void)mapViewTapped:(UIGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        if(!_camViewVisible)
        {
            _currentCamView.alpha = 1.0;
            _camViewVisible = YES;
        }
        else {
            _currentCamView.alpha = 0.0;
            _camViewVisible = NO;
        }
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
