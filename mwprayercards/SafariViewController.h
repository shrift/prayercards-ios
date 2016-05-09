//
//  SafariViewController.h
//  mwprayercards
//
//  Created by Steve Kim on 2012/01/30.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SafariViewController : UIViewController {

    IBOutlet UIWebView* webView;
    IBOutlet UIBarButtonItem* safariButton;
	NSString* urlstring;
    BOOL zoomEnabled;
	IBOutlet UIActivityIndicatorView* uiv;
    
    
}

-(IBAction) launchSafariBrowser:(id) sender;
-(id)initWithURLString:(NSString*)str;

@property (strong, nonatomic) IBOutlet UIWebView* webView;
@property (strong, nonatomic) NSMutableDictionary* card;
@property (strong, nonatomic, readonly) IBOutlet UIBarButtonItem* safariButton;
@property(nonatomic,readwrite,strong) NSString* urlstring;
@property (readwrite, nonatomic) BOOL zoomEnabled;
@property(readonly,nonatomic,strong) IBOutlet UIActivityIndicatorView* uiv;
@end
