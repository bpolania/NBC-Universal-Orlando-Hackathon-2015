//
//  ViewController.m
//  NBCUniversalHack
//
//  Created by Boris  on 3/28/15.
//  Copyright (c) 2015 LLT. All rights reserved.
//

#import "ViewController.h"

using namespace std;
using namespace cv;

@interface ViewController ()

@end

@implementation ViewController

@synthesize videoCamera;

- (IBAction)go:(id)sender {
    
    [self detectBody];
}

- (void)detectBody {
    
    NSError *error = nil;
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [session setSessionPreset:AVCaptureSessionPreset640x480];
    } else {
        [session setSessionPreset:AVCaptureSessionPresetPhoto];
    }
    // Select a video device, make an input
    AVCaptureDevice *device;
    AVCaptureDevicePosition desiredPosition = AVCaptureDevicePositionFront;
    // find the front facing camera
    for (AVCaptureDevice *d in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if ([d position] == desiredPosition) {
            device = d;
            isUsingFrontFacingCamera = YES;
            break;
        }
    }
    // fall back to the default camera.
    if( nil == device )
    {
        isUsingFrontFacingCamera = NO;
        device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    // get the input device
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if( !error ) {
        
        // add the input to the session
        if ( [session canAddInput:deviceInput] ){
            [session addInput:deviceInput];
        }
        
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
        self.previewLayer.backgroundColor = [[UIColor blackColor] CGColor];
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        
        CALayer *rootLayer = [self.previewView layer];
        [rootLayer setMasksToBounds:YES];
        [self.previewLayer setFrame:[rootLayer bounds]];
        [rootLayer addSublayer:self.previewLayer];
        [session startRunning];
        
    }
    session = nil;
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:
                                  [NSString stringWithFormat:@"Failed with error %d", (int)[error code]]
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:nil];
        [alertView show];
        //[self teardownAVCapture];
    }
    
}

- (IBAction)actionStart:(id)sender;
{
    [self.videoCamera start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    
    frames = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
- (void)processImage:(cv::Mat &)image;
{
    // Do some OpenCV stuff with the image
    
    if (frames < 30) {
        frames ++;
    } else {
        frames = 0;
    }
    
    cv::Mat imR(image.rows, image.cols, CV_8UC1);
    cv::Mat imG(image.rows, image.cols, CV_8UC1);
    cv::Mat imB(image.rows, image.cols, CV_8UC1);
    cv::Mat imRboost(image.rows, image.cols, CV_8UC1);
    
    Mat out[] = {imR, imG, imB};
    int from_to[] = {2,0  , 1, 1,  0, 2 };
    cv::mixChannels(&image, 1, out, 3, from_to, 3);
    
    cv::bitwise_not(imG, imG);
    cv::bitwise_not(imB, imB);
    
    cv::multiply(imR, imG, imRboost, (double)1/255);
    cv::multiply(imRboost, imB, imRboost, (double)1/255);
    
    image = imRboost;
    
    int total_whites = 0;
    
    Mat img = image;
    for(int y=0;y<img.rows;y++)
    {
        for(int x=0;x<img.cols;x++)
        {
            // get pixel
            
            int level = 45;
            Vec3b color = image.at<Vec3b>(cv::Point(x,y));
            if (color[0] > level && color[1] > level && color[2] > level) {
                
                total_whites++;
                
            } else {
                color[0] = 0;
                color[1] = 0;
                color[2] = 0;
                
            }
            // ... do something to the color ....
            
            // set pixel
            image.at<Vec3b>(cv::Point(x,y)) = color;
        }
    }

    NSLog(@"total_whites%i",total_whites);
    
}
#endif

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)thePicker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"XXX");
    
    UIImage *facePicture = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // draw a CI image with the previously loaded face detection picture
    CIImage* image = [CIImage imageWithCGImage:facePicture.CGImage];
    
    // create a face detector - since speed is not an issue we'll use a high accuracy
    // detector
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    
    NSArray *features = [[NSArray alloc] init];
    features = [detector featuresInImage:image];
    
    
    
    for(CIFaceFeature* faceFeature in features)
    {
        NSLog(@"LOCO");
        // create a UIView using the bounds of the face
        UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        
        // add a border around the newly created UIView
        faceView.layer.borderWidth = 1;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        
        // add the new view to create a box around the face
        //[picker.view.layer addSublayer:faceView.layer];
    }
}

@end
