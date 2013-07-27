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
        [self.view addSubview:[[UIImageView alloc] initWithImage:image]];
    }
}

-(void)viewDidAppear:(BOOL)animated{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
