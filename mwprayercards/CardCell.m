//
//  CardCell.m
//  savecity
//
//  Created by Steve Kim on 2011/11/02.
//  Copyright (c) 2011 Kobukson Studio LLC. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

@synthesize name;
@synthesize cellData;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)renderCell {
    if (cellData!=nil) {
        
        name.text = (NSString*) [cellData objectForKey:@"display title"];
    }
    
}


@end
