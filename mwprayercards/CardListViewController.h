//
//  CardListViewController.h
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SplashViewController;

@interface CardListViewController : UIViewController {
    
    IBOutlet UITableView* myTable;
    NSMutableArray* tableData;
}

@property(readwrite, nonatomic, strong) IBOutlet UITableView* myTable;
@property(readwrite, nonatomic, strong) NSMutableArray* tableData;



@end
