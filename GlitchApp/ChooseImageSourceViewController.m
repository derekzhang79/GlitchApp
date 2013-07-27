//
//  ChooseImageSourceViewController.m
//  GlitchApp
//
//  Created by Satansdeer satansdeer on 7/27/13.
//  Copyright (c) 2013 Satansdeer satansdeer. All rights reserved.
//

#import "ChooseImageSourceViewController.h"
#import "EditImageViewController.h"

@interface ChooseImageSourceViewController ()

@end

@implementation ChooseImageSourceViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.editImageController = [[EditImageViewController alloc] init];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    UIButton *fromFileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fromFileButton addTarget:self
                       action:@selector(getImageFromFile:)
             forControlEvents:UIControlEventTouchDown];
    [fromFileButton setTitle:@"From file" forState:UIControlStateNormal];
    fromFileButton.frame = CGRectMake(80.0, 200.0, 160.0, 40.0);
    [self.view addSubview:fromFileButton];
    UIButton *fromCameraButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fromCameraButton addTarget:self
                         action:@selector(getImageFromCamera:)
               forControlEvents:UIControlEventTouchDown];
    [fromCameraButton setTitle:@"From camera" forState:UIControlStateNormal];
    fromCameraButton.frame = CGRectMake(80.0, 260.0, 160.0, 40.0);
    [self.view addSubview:fromCameraButton];
}

- (void)getImageFromFile:(id)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
     imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
     imagePicker.delegate = self;
     imagePicker.allowsEditing = NO;
    [self.navigationController presentViewController:imagePicker animated:YES completion:^(void){
        [self.navigationController pushViewController:self.editImageController animated:NO];
    }];
}

- (void)getImageFromCamera:(id)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [self.navigationController presentViewController:imagePicker animated:YES completion:^(void){
        [self.navigationController pushViewController:self.editImageController animated:NO];
    }];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *imagePath = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    NSString *imageName = @"image.png";
    if(imagePath){
        imageName = [imagePath lastPathComponent];
    }
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self.editImageController setImageForEditing:image];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
