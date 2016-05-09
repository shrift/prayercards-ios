//
//  SafariViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/01/30.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "SafariViewController.h"
#import "Utils.h"

@implementation SafariViewController

@synthesize webView;
@synthesize card;
@synthesize uiv;
@synthesize safariButton;
@synthesize urlstring;
@synthesize zoomEnabled;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


-(id)initWithURLString:(NSString*)str
{
	if(self = [super initWithNibName:@"SafariViewController" bundle:nil])
	{
		self.urlstring = str;
	}
	zoomEnabled = YES;
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
    
    self.navigationItem.title = @"The Divine Hours";
	[[self navigationItem] setRightBarButtonItem:safariButton];
    
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
    [uiv startAnimating];
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstring]]];
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

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	//NSLog(@"webView did finish load");
	[uiv stopAnimating];

	if (zoomEnabled) {
		//[self.webView stringByEvaluatingJavaScriptFromString:@"document.body.style.zoom = 2.5"];		
	}
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	//NSLog(@"webView didStart load for url:%@", [webView request]);
	[uiv startAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	[Utils showAlertDialogTitle:@"Load failed" withMessage:@"The page you are trying to view could not be loaded."];
	[uiv stopAnimating];
}




-(IBAction) launchSafariBrowser:(id) sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlstring]]; 
}
 
@end
