//
//  TutorialAppDelegate.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/7/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialAppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableArray *_drinks;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *drinks;

@end
