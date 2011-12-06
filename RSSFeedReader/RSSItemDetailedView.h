//
//  RSSItemDetailedView.h
//  RSSFeedReader
//
//  Created by Thomas Wilson on 06/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndicatorViewController.h"
#import "RSSItem.h"
@interface RSSItemDetailedView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (nonatomic, retain) RSSItem *item;
@end
