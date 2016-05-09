//
//  AboutViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "SplashViewController.h"
#import "SafariViewController.h"

@implementation SplashViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    /*
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        bookButton.frame = CGRectMake(20, 20, 210, 200);
        pathosButton.frame = CGRectMake(250, 20, 210, 200);
    }
    else
    {
        bookButton.frame = CGRectMake(20, 40, 280, 170);
        pathosButton.frame = CGRectMake(20, 200, 280, 170);
    }
    */
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    /*
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        bookButton.frame = CGRectMake(20, 20, 210, 200);
        pathosButton.frame = CGRectMake(250, 20, 210, 200);
    }
    else
    {
        bookButton.frame = CGRectMake(20, 40, 280, 170);
        pathosButton.frame = CGRectMake(20, 200, 280, 170);
    }
    */
}


@end
