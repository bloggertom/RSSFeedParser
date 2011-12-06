//
//  AppDelegate.h
//  RSSFeedReader
//
//  Created by Thomas Wilson on 05/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSFeedTableView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) RSSFeedTableView *viewController;

@end
