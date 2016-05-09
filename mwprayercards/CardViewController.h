//
//  CardViewController.h
//  mwprayercards
//
//  Created by Steve Kim on 2012/01/30.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewController : UIViewController {

    IBOutlet UIWebView* webView;
    NSMutableDictionary* card;
    IBOutlet UISegmentedControl* segControl;
    
}

@property (strong, nonatomic) IBOutlet UIWebView* webView;
@property (strong, nonatomic) NSMutableDictionary* card;
@property (strong, nonatomic) IBOutlet UISegmentedControl* segControl;


-(IBAction) nextCard:(id)sender;
-(IBAction) previousCard:(id)sender;
-(void) loadCurrentCard;
-(IBAction) segmentedControlClick:(id)sender;

@end
