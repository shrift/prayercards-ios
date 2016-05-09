//
//  AboutViewController.h
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController <UIAlertViewDelegate> {
    IBOutlet UIButton* bookButton;
    IBOutlet UIButton* pathosButton;
    
    IBOutlet UILabel* bookLabel;
    IBOutlet UILabel* pathosLabel;
}


-(IBAction) viewBook:(id) sender;
-(IBAction) aboutPathosEthos:(id) sender;


@property(nonatomic, strong) IBOutlet UIButton* bookButton;
@property(nonatomic, strong) IBOutlet UIButton* pathosButton;
@property(nonatomic, strong) IBOutlet UILabel* bookLabel;
@property(nonatomic, strong) IBOutlet UILabel* pathosLabel;

@end
