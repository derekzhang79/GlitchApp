//
//  EditImageViewController.h
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditImageViewController : UIViewController

@property (nonatomic, retain) UIImage*image;
@property (nonatomic, retain) UIImageView*imageView;

-(id)initWithImage:(UIImage*)image;
-(void)setImageForEditing:(UIImage*)image;

@end
