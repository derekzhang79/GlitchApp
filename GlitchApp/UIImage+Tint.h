//
//  UIImage+Tint.h
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/28/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

- (UIImage *)imageTintedWithColor:(UIColor *)color;
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

@end
