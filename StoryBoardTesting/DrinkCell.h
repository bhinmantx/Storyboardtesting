//
//  DrinkCell.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkCell : UITableViewCell{
    UILabel *_drinkname;
    UILabel *_description;
    UIImageView *_thumbnail;
}

@property (nonatomic, strong) IBOutlet UILabel *drinkname;
@property (nonatomic, strong) IBOutlet UILabel *description;
@property (nonatomic, strong) IBOutlet UIImageView *thumbnail;

@end
