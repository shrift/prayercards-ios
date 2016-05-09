//
//  Utils.h
//  ParadeOfHomes
//
//  Created by blinky on 2011/01/19.
//  Copyright 2011 Kobukson Studio LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FILE_NAME @"DataSource_SAVEFILE"


@interface Utils : NSObject {

}

+(void) showAlertDialogTitle:(NSString*) myTitle withMessage:(NSString*) myMessage; 

+(NSString*) getDialablePhoneNumber:(NSString*) phoneNumber;


@end
