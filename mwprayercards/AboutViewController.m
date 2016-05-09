//
//  AboutViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "AboutViewController.h"
#import "SafariViewController.h"

@interface AboutViewController () {
    
    CGFloat buttonLandscapeWidth;
    CGFloat buttonLandscapeHeight;
    
    CGFloat buttonPortraitWidth;
    CGFloat buttonPortraitHeight;
}
@end


@implementation AboutViewController

@synthesize bookButton, pathosButton;
@synthesize bookLabel, pathosLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"icon_info"];
        
        buttonLandscapeWidth = 210;
        buttonLandscapeHeight = 200;
        
        buttonPortraitWidth = 210;
        buttonPortraitHeight = 200;
        
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
    
    [super viewWillAppear:animated];
    [self repositionButtons:self.interfaceOrientation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self repositionButtons:toInterfaceOrientation];
}

-(void) repositionButtons:(UIInterfaceOrientation) toInterfaceOrientation {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    CGFloat x = frame.size.height;
    CGFloat y = frame.size.width;
    
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
        bookButton.frame = CGRectMake((longSide/4)*1 - buttonLandscapeWidth/2, shortSide/2 - buttonLandscapeHeight/2, buttonLandscapeWidth, buttonLandscapeHeight);
        pathosButton.frame = CGRectMake((longSide/4)*3 - buttonLandscapeWidth/2, shortSide/2 - buttonLandscapeHeight/2, buttonLandscapeWidth, buttonLandscapeHeight);
    }
    else
    {
        bookButton.frame = CGRectMake(shortSide/2 - buttonPortraitWidth/2, (longSide/8)*3 - buttonPortraitHeight/2, buttonPortraitWidth, buttonPortraitHeight);
        pathosButton.frame = CGRectMake(shortSide/2 - buttonPortraitWidth/2, (longSide/8)*5 - buttonPortraitHeight/2, buttonPortraitWidth, buttonPortraitHeight);
    }
}


-(IBAction) viewBook:(id) sender {

    /*
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    SafariViewController* svc = [[SafariViewController alloc] initWithURLString:@"http://www.amazon.com/Mystically-Wired-Exploring-Realms-Prayer/dp/B004IEA3EM"];
    [self.navigationController pushViewController:svc animated:YES];    
    */
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.amazon.com/Mystically-Wired-Exploring-Realms-Prayer/dp/B004IEA3EM"]]; 
    
    
    NSString* title = @"Launch Safari";
    NSString* message = @"This will close the app and take you to Amazon.com. Okay to proceed?";
    UIAlertView *alertDialog = [[UIAlertView alloc]
                                initWithTitle: title
                                message: message
                                delegate:self
                                cancelButtonTitle:@"Cancel"
                                otherButtonTitles:@"Sure", nil];	
    [alertDialog show];
    

}

-(IBAction) aboutPathosEthos:(id) sender {

    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.amazon.com/Mystically-Wired-Exploring-Realms-Prayer/dp/B004IEA3EM"    
                                               // ]]; 
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    SafariViewController* svc = [[SafariViewController alloc] initWithURLString:@"http://www.pathosethos.com"];
    [self.navigationController pushViewController:svc animated:YES];    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.amazon.com/Mystically-Wired-Exploring-Realms-Prayer/dp/B004IEA3EM"]]; 
        
    }
}


@end
