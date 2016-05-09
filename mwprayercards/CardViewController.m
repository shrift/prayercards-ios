//
//  FirstViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/01/30.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "CardViewController.h"
#import "DataSource.h"

@implementation CardViewController

@synthesize webView;
@synthesize card;
@synthesize segControl;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString* displayTitle = [self.card objectForKey:@"display title"];
    
    //[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]]];
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:segControl];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    
    NSString* resourceName = [self.card objectForKey:@"resource"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:resourceName ofType:@"html"]isDirectory:NO]]];
    
    self.navigationItem.title = displayTitle;
    
    UISwipeGestureRecognizer *leftSwipe =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *rightSwipe =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    leftSwipe.cancelsTouchesInView = NO;
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    rightSwipe.cancelsTouchesInView = NO;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;    
    
    [webView addGestureRecognizer:leftSwipe];
    [webView addGestureRecognizer:rightSwipe];

}

-(void) handleSwipe:(UIGestureRecognizer*) gestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
        
        UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *)gestureRecognizer;
        
        if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
            [self nextCard:nil];
        else if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
            [self previousCard:nil];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
- (void)webViewDidFinishLoad:(UIWebView *)webview {

    NSLog(@"got here");
    NSString *javaScript = @"var metatags = document.getElementsByTagName('meta'); \
    for(cnt = 0; cnt < metatags.length; cnt++) { \
    var element = metatags[cnt]; \
    if(element.getAttribute('name') == 'viewport') { \
    element.setAttribute('content','width = device-width; user-scalable = yes'); \
    } \
    }";
    [webview stringByEvaluatingJavaScriptFromString:javaScript];
}
*/

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    /*
    NSString* title = [self.card objectForKey:@"display title"];
    if ([title isEqualToString:@"Adore God Through Focused Attention"]) {
        if ([self interfaceOrientation] == UIInterfaceOrientationPortrait ||
            [self interfaceOrientation] == UIInterfaceOrientationPortraitUpsideDown) {
            
            title = @"Focused Attention";
        }
    }
    else if ([title isEqualToString:@"Prayer of Love and Remembrance"]) {
        
        if ([self interfaceOrientation] == UIInterfaceOrientationPortrait ||
            [self interfaceOrientation] == UIInterfaceOrientationPortraitUpsideDown) {
            
            title = @"Love and Remembrance";
        }        
    }

    self.navigationItem.title = title;
    */
}

-(IBAction) nextCard:(id)sender {
    
    [[DataSource sharedDataSource] incrementCardIndex];
    [self loadCurrentCard];
}

-(IBAction) previousCard:(id)sender {
    
    [[DataSource sharedDataSource] decrementCardIndex];
    [self loadCurrentCard];
}

-(void) loadCurrentCard {
    
    NSMutableDictionary* currentCard = [[DataSource sharedDataSource] getCurrentCard];
    NSString* displayTitle = [currentCard objectForKey:@"display title"];
    NSString* resourceName = [currentCard objectForKey:@"resource"];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:resourceName ofType:@"html"]isDirectory:NO]]];
    
    self.navigationItem.title = displayTitle;
}
 

-(IBAction) segmentedControlClick:(id)sender {
    //NSLog(@"Clicked!");
    UISegmentedControl* segment = (UISegmentedControl*) sender;
       
    if (segment.selectedSegmentIndex == 0){
        [self previousCard: nil];
    }
    else if (segment.selectedSegmentIndex == 1){
        [self nextCard: nil];
    }
    
}

@end
