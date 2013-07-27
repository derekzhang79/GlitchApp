//
//  EditImageViewController.m
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import "EditImageViewController.h"
#define MAX_CHUNK 80
#define MAX_OFFSET 40

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
    if(self.imageView){
        [self.imageView removeFromSuperview];
    }
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    self.imageView = [[UIImageView alloc] initWithImage:image];
    CGRect currentRect = self.imageView.frame;
    currentRect.size.height = currentRect.size.height* (screenWidth/currentRect.size.width);
    currentRect.size.width = screenWidth;
    currentRect.origin = CGPointMake(0, screenHeight/2 - self.imageView.frame.size.height/2);
    self.imageView.frame = currentRect;
    [self.view addSubview:self.imageView];
}

-(void)viewDidAppear:(BOOL)animated{
}

-(void)glitch{
    int currentY = 0;
    int nextY = 0;
    UIGraphicsBeginImageContext(CGSizeMake(self.image.size.width, self.image.size.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    [self.image drawAtPoint:CGPointZero];
    while(currentY < self.image.size.height - 10){
        int dY = arc4random()%([NSNumber numberWithFloat:self.image.size.height].intValue - currentY);
        if(dY >MAX_CHUNK){
            dY = MAX_CHUNK;
        }
        int dX = arc4random()%MAX_OFFSET;
        if(arc4random()%2 == 1){
            dX = self.image.size.width - dX;
        }
        CGRect cropRect = CGRectMake(0, currentY, dX, dY);
        nextY = currentY + dY;
        CGImageRef imageRef = CGImageCreateWithImageInRect([self.image CGImage], cropRect);
        UIImage*firstPartImage = [UIImage imageWithCGImage:imageRef];
        CGRect secondRect = cropRect;
        secondRect.origin.x = cropRect.size.width;
        secondRect.size.width = self.image.size.width - secondRect.size.width;
        CGImageRef secondImageRef = CGImageCreateWithImageInRect([self.image CGImage], secondRect);
        UIImage*secondPartImage = [UIImage imageWithCGImage:secondImageRef];
        CGImageRelease(imageRef);
        CGImageRelease(secondImageRef);
        [firstPartImage drawInRect:CGRectMake(self.image.size.width - cropRect.size.width, currentY, cropRect.size.width, cropRect.size.height)];
        [secondPartImage drawInRect:CGRectMake(0, currentY, secondRect.size.width, secondRect.size.height)];
        currentY = nextY;
    }
    UIGraphicsPopContext();
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setImageForEditing:outputImage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    CGRect frame, remain;
    CGRectDivide(self.view.bounds, &frame, &remain, 44, CGRectMaxYEdge);
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:frame];
    [toolbar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [items addObject:flexibleSpace];
    [items addObject:[[UIBarButtonItem alloc] initWithTitle:@"Glitch!" style:UIBarButtonItemStyleBordered target:self action:@selector(glitch)]];
    [items addObject:flexibleSpace];
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
