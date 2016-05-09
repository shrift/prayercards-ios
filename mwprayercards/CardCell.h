//
//  CardCell.h
//  savecity
//
//  Created by Steve Kim on 2011/11/02.
//  Copyright (c) 2011 Kobukson Studio LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCell : UITableViewCell{
    
	IBOutlet UILabel* name;
    id cellData;
}

@property(strong,nonatomic,readonly) IBOutlet UILabel* name;
@property(strong,nonatomic,readwrite) id cellData;


-(void)renderCell;

@end
