//
//  TutorialDrinkDetailViewController.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drink.h"
@interface TutorialDrinkDetailViewController : UIViewController{
    Drink *_drink;
    UILabel *_DrinkName;
    UILabel *_DrinkDescription;
}

//@property (strong, nonatomic) IBOutlet UINavigationItem *DrinkTitle;
@property (strong, nonatomic) IBOutlet UILabel *DrinkName;
@property (strong, nonatomic) IBOutlet UILabel *DrinkDescription;

@property (strong, nonatomic) Drink *drink;


@end
