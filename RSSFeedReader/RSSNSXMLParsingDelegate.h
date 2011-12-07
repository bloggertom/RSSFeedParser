//
//  RSSXMLParsingDelegate.h
//  Shopshire App
//
//  Created by Thomas Wilson on 16/11/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSItem.h"
@interface RSSNSXMLParsingDelegate : NSObject <NSXMLParserDelegate>

@property (nonatomic, copy) NSURL *url;
@property (nonatomic, retain)NSXMLParser *parser;
@property (nonatomic, retain)NSMutableString *currentString;
@property (nonatomic, retain)RSSItem *currentItem;
@property (nonatomic, retain)NSMutableArray *currentArray;

-(id)init;
-(id)initWithURL: (NSString *)thisURL;
-(NSMutableArray *) getRSSArray;
-(NSMutableString *)xmlSimpleUnescapeString:(NSMutableString *)thisString;

@end
