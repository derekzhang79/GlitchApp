//
//  RootViewController.h
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UINavigationController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

+ (RootViewController *)sharedRootController;

@end
