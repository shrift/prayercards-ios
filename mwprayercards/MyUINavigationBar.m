//
//  MyUINavigationBar.m
//  CertifiedProfile
//
//  Created by Steve Kim on 2011/10/19.
//  Copyright (c) 2011 Kobukson Studio LLC. All rights reserved.
//

#import "MyUINavigationBar.h"

@implementation MyUINavigationBar

- (void)drawRect:(CGRect)rect {
	
    UIImage *image = [UIImage imageNamed: @"titleBar.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    //61 65 92
    self.backgroundColor = [UIColor colorWithRed:61.0f/255.0f green:65.0f/255.0f blue:92.0f/255.0f alpha:1.0f];
}

@end
