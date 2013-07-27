//
//  RootViewController.m
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import "RootViewController.h"
#import "ChooseImageSourceViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

+ (RootViewController *)sharedRootController {
    static RootViewController *_controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _controller = [[RootViewController alloc] init];
    });
    return _controller;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [self pushViewController:[[ChooseImageSourceViewController alloc] init] animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationBarHidden = YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
