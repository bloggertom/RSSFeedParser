//
//  RSSTBXMLParserDelegate.m
//  RSSFeedReader
//
//  Created by Thomas Wilson on 07/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "RSSTBXMLParserDelegate.h"

@implementation RSSTBXMLParserDelegate

@synthesize parser;
@synthesize url;
@synthesize unescaper;
@synthesize currentItem;
@synthesize currentArray;
@synthesize categoriesArray;
-(id)init{
    return [self initWithURL:@""];
}

-(id)initWithURL:(NSString *)thisURL{
    self = [super init];
    url = [[NSURL alloc]initWithString:thisURL];
    //parser = [[TBXML alloc]initWithURL:thisURL];
    return self;
}

-(NSMutableArray *) getRSSArray;{
    currentArray = [[NSMutableArray alloc]init];
    if ([url.absoluteString isEqualToString:@""]) {
        NSLog(@"No URL set in delegate");
        return false;
    }
    parser = [[TBXML alloc] initWithURL:self.url];
    unescaper = [[XMLUnescaper alloc]init];
    if (parser.rootXMLElement) {
        [self parseElements:parser.rootXMLElement];
    }else{
        NSLog(@"Parser Couldn't find Root element");
    }
    
    return currentArray;
}
-(void)parseElements:(TBXMLElement *)element{
    do {
        if (element->firstChild){
            [self parseElements:element->firstChild];
        }
        if ([[TBXML elementName:element] isEqualToString:@"item"]) {
            
            TBXMLElement *title = [TBXML childElementNamed:@"title" parentElement:element];
            TBXMLElement *description = [TBXML childElementNamed:@"description" parentElement:element];
            TBXMLElement *iurl = [TBXML childElementNamed:@"link" parentElement:element];
            TBXMLElement *comments = [TBXML childElementNamed:@"comments" parentElement:element];
            TBXMLElement *pubDate = [TBXML childElementNamed:@"pubDate" parentElement:element];
            
            currentItem = [[RSSItem alloc]init];
            currentItem.title = [unescaper xmlSimpleUnescapeString:[NSMutableString stringWithString:[TBXML textForElement:title]]];
            currentItem.itemDiscription = [unescaper xmlSimpleUnescapeString:[NSMutableString stringWithString:[TBXML textForElement:description]]];
            currentItem.link = [NSURL URLWithString:[TBXML textForElement:iurl]];
            currentItem.comments = [NSURL URLWithString:[TBXML textForElement:comments]];
            currentItem.categories = categoriesArray;
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss zzzz";
            currentItem.pubDate = [formatter dateFromString:[TBXML textForElement:pubDate]];
            NSLog(@"%@",[formatter stringFromDate:currentItem.pubDate]);
            
            
            
            [currentArray addObject:currentItem];
            //NSLog(@"%@",currentItem.itemDiscription);
            categoriesArray = nil;
            currentItem = nil;
        }
        if ([[TBXML elementName:element] isEqualToString:@"category"]) {
            if (!categoriesArray) {
                categoriesArray = [[NSMutableArray alloc]init];
            }
            NSString *type = [TBXML textForElement:element];
            [categoriesArray addObject:type];
            
        }


        
    }while ((element = element->nextSibling));
}



@end
