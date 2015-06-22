//
//  ViewController.h
//  NBCUniversalHack
//
//  Created by Boris  on 3/28/15.
//  Copyright (c) 2015 LLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/videoio/cap_ios.h>
#import <opencv2/highgui/highgui_c.h>
#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/imgproc_c.h>

#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <CvVideoCameraDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {

    CvVideoCamera* videoCamera;
    
    IBOutlet UIImageView* imageView;
    IBOutlet UIButton* button;
    
    int frames;
    
    UIImagePickerController *picker;
    
    BOOL isUsingFrontFacingCamera;

}

@property (nonatomic, retain) CvVideoCamera* videoCamera;

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) IBOutlet UIView *previewView;



@end

