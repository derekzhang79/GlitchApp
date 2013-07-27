//
//  EditImageViewController.m
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import "EditImageViewController.h"

@interface EditImageViewController ()

@end

@implementation EditImageViewController

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

-(void)setImageForEditing:(UIImage*)image{
    self.image = image;
    if(self.image){
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        CGRect currentRect = imageView.frame;
        currentRect.size.height = currentRect.size.height* (screenWidth/currentRect.size.width);
        currentRect.size.width = screenWidth;
        currentRect.origin = CGPointMake(0, self.view.frame.size.height/2 - imageView.frame.size.height/2);
        imageView.frame = currentRect;
        [self.view addSubview:imageView];
    }
}

-(void)viewDidAppear:(BOOL)animated{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
