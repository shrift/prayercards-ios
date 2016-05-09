//
//  DivineHoursChoiceViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "DivineHoursChoiceViewController.h"
#import "SafariViewController.h"

@implementation DivineHoursChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"The Divine Hours", @"The Divine Hours");
        self.tabBarItem.image = [UIImage imageNamed:@"icon_clock"];
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
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self repositionUI:self.interfaceOrientation];
}

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(IBAction)viewFullPage:(id)sender {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;

    
    SafariViewController* svc = [[SafariViewController alloc] initWithURLString:@"http://www.annarborvineyard.org/tdh/tdh.cfm"];
    [self.navigationController pushViewController:svc animated:YES];
}

-(IBAction)viewMobilePage:(id)sender {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;

    
    SafariViewController* svc = [[SafariViewController alloc] initWithURLString:@"http://www.annarborvineyard.org/tdh/tdh-iphone.cfm"];
    [self.navigationController pushViewController:svc animated:YES];    
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self repositionUI:toInterfaceOrientation];
}


-(void) repositionUI:(UIInterfaceOrientation) toInterfaceOrientation {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    CGFloat x = frame.size.height;
    CGFloat y = frame.size.width;
    
    CGFloat containerWidth = 320;
    CGFloat containerHeight = 300;
    
    CGFloat longSide, shortSide;
    
    if (x > y) {
        longSide = x; shortSide = y;
    }
    else {
        shortSide = x; longSide = y;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {        
        containerView.frame = CGRectMake(longSide/2 - containerWidth/2, shortSide/2 - containerHeight/2, containerWidth, containerHeight);
    }
    else
    {
        containerView.frame = CGRectMake(shortSide/2 - containerWidth/2, longSide/2 - containerHeight/2, containerWidth, containerHeight);
    }
}

@end
