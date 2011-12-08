//
//  RSSTBXMLParserDelegate.h
//  RSSFeedReader
//
//  Created by Thomas Wilson on 07/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "RSSItem.h"
#import "XMLUnescaper.h"
#import "NSDataAdditions.h"
@interface RSSTBXMLParserDelegate : NSObject

@property(nonatomic, retain)TBXML *parser;
@property(nonatomic, retain)NSURL *url;
@property(nonatomic, retain)XMLUnescaper *unescaper;
@property(nonatomic, retain)RSSItem *currentItem;
@property(nonatomic, retain)NSMutableArray *currentArray;

-(id)init;
-(id)initWithURL: (NSString *)thisURL;
-(NSMutableArray *) getRSSArray;
-(void)parseElements:(TBXMLElement *)element;

@end
