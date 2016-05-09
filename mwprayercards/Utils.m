//
//  Utils.m
//  ParadeOfHomes
//
//  Created by blinky on 2011/01/19.
//  Copyright 2011 Kobukson Studio LLC. All rights reserved.
//

#import "Utils.h"


@implementation Utils


+(void) showAlertDialogTitle:(NSString*) myTitle withMessage:(NSString*) myMessage 
{
    UIAlertView *alertDialog = [[UIAlertView alloc]
								initWithTitle: myTitle
								message: myMessage
								delegate:nil
								cancelButtonTitle:@"OK"
								otherButtonTitles:nil];	
	[alertDialog show];
}


+(NSString*) getDialablePhoneNumber:(NSString*) phoneNumber
{
	NSMutableString *strippedString = [NSMutableString stringWithCapacity:10];	
	
	for (int i=0; i<[phoneNumber length]; i++) {
        if (isdigit([phoneNumber characterAtIndex:i])) {
			[strippedString appendFormat:@"%c",[phoneNumber characterAtIndex:i]];
        }
	}	
	return strippedString;
}



@end
