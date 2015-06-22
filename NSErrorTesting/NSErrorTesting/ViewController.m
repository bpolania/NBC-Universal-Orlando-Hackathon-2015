//
//  ViewController.m
//  NSErrorTesting
//
//  Created by Boris  on 4/1/15.
//  Copyright (c) 2015 LLT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"No Data.", nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Card may be empty", nil)
                               };
    
    NSError *error = [NSError errorWithDomain:@"FlomioDomain"
                                         code:-1
                                     userInfo:userInfo];
    
    
    
    /*
     
     NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
     NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"No Data.", nil),
     NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Card may be empty", nil)
     
     NSError *error = [NSError errorWithDomain:@"FlomioDomain"
     code:-2
     userInfo:userInfo];
     
     NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
     NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"UID/ATS reached before LE bytes.", nil),
     NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Maybe you withdraw the card too soon", nil)
     
     NSError *error = [NSError errorWithDomain:@"FlomioDomain"
     code:-3
     userInfo:userInfo];
     
     NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
     NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Wrong Length.", nil),
     NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Data in card may be corrupt", nil)
     
     NSError *error = [NSError errorWithDomain:@"FlomioDomain"
     code:-4
     userInfo:userInfo];
     
     NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
     NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Wrong Length.", nil),
     NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Data in card may be corrupt", nil)
     
     NSError *error = [NSError errorWithDomain:@"FlomioDomain"
     code:-5
     userInfo:userInfo];
     
     NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
     NSLocalizedFailureReasonErrorKey: NSLocalizedString(@" Function not supported.", nil),
     NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Data in card may be corrupt", nil)
     
     NSError *error = [NSError errorWithDomain:@"FlomioDomain"
     code:-6
     userInfo:userInfo];

     
     */
    /*
     
     else if ([response isEqualToString:@"90 00"])
     self.logView.text = [NSString stringWithFormat:@"%@\nSuccess: No data included.", self.logView.text]; // Success but not data
     else if ([response isEqualToString:@"62 82"])
     self.logView.text = [NSString stringWithFormat:@"%@\nWarning: UID/ATS reached before LE bytes.", self.logView.text]; // UID/ATS reached
     else if ([response isEqualToString:@"6C"])
     self.logView.text = [NSString stringWithFormat:@"%@\nError: Wrong length.", self.logView.text]; // Wrong length
     else if ([response isEqualToString:@"63 00"])
     self.logView.text = [NSString stringWithFormat:@"%@\nError: The operation failed.", self.logView.text]; // The operation failed
     else if ([response isEqualToString:@"6A 81"])
     self.logView.text = [NSString stringWithFormat:@"%@\nError: Function not supported.", self.logView.text]; // Function not supported
     else
     self.logView.text = [NSString stringWithFormat:@"%@\nError: Unknown.", self.logView.text]; // Unknown
     
     
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
