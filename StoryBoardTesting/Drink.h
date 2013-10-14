//
//  Drink.h
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/7/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drink : NSObject {

    NSString *_name;
    NSString *_description;
    NSString *_thumbnailname;
    NSString *_abv;
    
}

@property (nonatomic,copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic,copy) NSString *thumbnailname;
@property (nonatomic,copy) NSString *abv;

@end
