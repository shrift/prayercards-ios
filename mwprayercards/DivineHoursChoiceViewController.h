//
//  DivineHoursViewChoiceController.h
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DivineHoursChoiceViewController : UIViewController {
    IBOutlet UIView *containerView;
}

-(IBAction) viewFullPage:(id)sender;
-(IBAction) viewMobilePage:(id)sender;

@end
