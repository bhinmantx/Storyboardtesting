//
//  AddDrinkController.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "Drink.h"
#import "GamePickerViewController.h"
@class AddDrinkController;
@protocol AddDrinkControllerDelegate <NSObject>

-(void)addDrinkControllerDidCancel:(AddDrinkController *)controller;
//-(void)addDrinkControllerDidSave:(AddDrinkController *)controller;
-(void)addDrinkControllerDidAddDrink:(Drink *)drink;

@end



#import <UIKit/UIKit.h>

@interface AddDrinkController : UITableViewController <GamePickerViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>{
    UIPickerView *_thumbNailPicker;
    NSMutableArray *_thumbNailNames;
}


@property (nonatomic, weak) id <AddDrinkControllerDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@property (strong,nonatomic) NSMutableArray *thumbNailNames;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ThumbNailName;
@property (strong, nonatomic) IBOutlet UIImageView *Thumbnail;
@property (strong, nonatomic) IBOutlet UITextField *descriptionField;
@property (strong, nonatomic) IBOutlet UIPickerView *thumbnailPicker;
@property (strong, nonatomic) IBOutlet UILabel *thumbnailPickerFilename;

@property (strong, nonatomic) IBOutlet UILabel *gameNameField;


@end
