//
//  GamePickerViewController.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerViewController;

@protocol GamePickerViewControllerDelegate <NSObject>

-(void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game;

@end

@interface GamePickerViewController : UITableViewController {
    NSArray *games;
  //  NSUInteger selectedIndex;
}

@property (nonatomic, weak) id <GamePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
