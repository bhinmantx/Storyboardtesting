//
//  DrinkViewController.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/7/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddDrinkController.h"
#import "GamePickerViewController.h"

@interface DrinkViewController : UITableViewController <AddDrinkControllerDelegate> {
    
    NSMutableArray *_drinks;
}


@property (strong, nonatomic) NSMutableArray *drinks;


@end
