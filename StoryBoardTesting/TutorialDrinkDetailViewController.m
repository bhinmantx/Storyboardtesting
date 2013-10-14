//
//  TutorialDrinkDetailViewController.m
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "TutorialDrinkDetailViewController.h"

@interface TutorialDrinkDetailViewController ()

@end

@implementation TutorialDrinkDetailViewController

@synthesize drink;
@synthesize DrinkName = _DrinkName;
//@synthesize DrinkTitle;
@synthesize DrinkDescription = _DrinkDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  _DrinkName.text = drink.name;
  _DrinkDescription.text = drink.description;
    
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
