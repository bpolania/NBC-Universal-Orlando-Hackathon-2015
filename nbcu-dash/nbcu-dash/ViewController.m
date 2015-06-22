//
//  ViewController.m
//  nbcu-dash
//
//  Created by Boris  on 3/29/15.
//  Copyright (c) 2015 LLT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize segmented;

- (IBAction)change:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"activatedUser"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
            
            PFObject *selected = [objects objectAtIndex:0];
            if (segmented.selectedSegmentIndex == 0) {
                [selected setValue:@"Boris" forKey:@"activated"];
                NSLog(@"Boris");
                
            } else {
                [selected setValue:@"Allyn" forKey:@"activated"];
                NSLog(@"Allyn");
            }
            
            [selected saveInBackground];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
