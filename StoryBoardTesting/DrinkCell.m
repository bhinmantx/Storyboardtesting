//
//  DrinkCell.m
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "DrinkCell.h"

@implementation DrinkCell


@synthesize drinkname =  _drinkname;
@synthesize description = _description;
@synthesize thumbnail = _thumbnail;



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

/////Code from Lextech about removing constraints.
////This code works but throws all kinds of exceptions
/*
 ///Notes: 
 //This method does not save the priority of the constraint. To make this work completely, just add ‘contentViewConstraint.priority = cellConstraint.priority;’ before the addConstraint: call.
///////
 ///Keep in mind that if you have any IBOutlets with constraints in them to move/animate things inside of the cell, you’ll have to hook them up manually 
 ////as this method will recreate the constraint, leaving you referencing the wrong object
 */

-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"%@", @"Awake From Nib");
    for (NSLayoutConstraint *cellConstraint in self.constraints)
    {
        [self removeConstraint:cellConstraint];
        
        id firstItem = cellConstraint.firstItem == self ? self.contentView : cellConstraint.firstItem;
        id seccondItem = cellConstraint.secondItem == self ? self.contentView : cellConstraint.secondItem;
        
        NSLayoutConstraint* contentViewConstraint = [NSLayoutConstraint constraintWithItem:firstItem
                                                                                 attribute:cellConstraint.firstAttribute
                                                                                 relatedBy:cellConstraint.relation
                                                                                    toItem:seccondItem
                                                                                 attribute:cellConstraint.secondAttribute
                                                                                multiplier:cellConstraint.multiplier
                                                                                  constant:cellConstraint.constant];
        
        [self.contentView addConstraint:contentViewConstraint];
    }
}



@end
