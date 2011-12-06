//
//  RSSFeedTableView.h
//  RSSFeedReader
//
//  Created by Thomas Wilson on 05/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSXMLParsingDelegate.h"
#import "IndicatorViewController.h"
@interface RSSFeedTableView : UITableViewController

@property (nonatomic, retain)NSMutableArray *rssData;
@property (nonatomic, retain)RSSXMLParsingDelegate *rssParser;
@property (nonatomic, retain)IndicatorViewController *activityView;
@end
