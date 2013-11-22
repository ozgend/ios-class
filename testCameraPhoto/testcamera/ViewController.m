//
//  ViewController.m
//  testcamera
//
//  Created by ozgend on 11/21/13.
//  Copyright (c) 2013 btakademi. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

- (BOOL) isCameraAvailable;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)takePicture:(id)sender {
    
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self ;
    picker.allowsEditing = YES;
    
    if ([self isCameraAvailable]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
    }
    else{
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    NSLog(@"didFinishPickingImage");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"imagePickerControllerDidCancel");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *image;
    
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        
        image = (UIImage *) [info objectForKey: UIImagePickerControllerEditedImage];
        
        [self.photoView setImage: image];
        
        if ([self isCameraAvailable]) {
            UIImageWriteToSavedPhotosAlbum (image, nil, nil , nil);
        }
    }
    
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
        
        //save to file
        //if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath.description)) {
        //    UISaveVideoAtPathToSavedPhotosAlbum (moviePath.description, nil, nil, nil);
        //}
    }
    
}

- (BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera];
}


@end
