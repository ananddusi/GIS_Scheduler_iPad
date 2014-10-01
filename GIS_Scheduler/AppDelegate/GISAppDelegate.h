//
//  AppDelegate.h
//  GIS_Scheduler
//
//  Created by Paradigm on 08/07/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GISContactAndBillingObject.h"

@interface GISAppDelegate : UIResponder <UIApplicationDelegate,UISplitViewControllerDelegate>

@property (nonatomic) SEL finishAction_chooseRequestNumber;
@property (strong, nonatomic) UIWindow *window;

@property (strong,nonatomic) UISplitViewController *spiltViewController;

@property (strong, nonatomic) UINavigationController *navigationcontroller;

@property(nonatomic,strong)id detailViewController;

@property (readwrite, nonatomic) BOOL isLogout;
@property (readwrite, nonatomic) BOOL isContact;

@property (readwrite, nonatomic) BOOL isFromContacts;
@property (readwrite, nonatomic) BOOL isNewRequest;
@property (readwrite, nonatomic) BOOL isAttendees;
@property (readwrite, nonatomic) BOOL isFromViewEditService;
@property (readwrite, nonatomic) BOOL isNoofAttendees;

@property(nonatomic,strong) GISContactAndBillingObject *contact_billingObject;
@property(nonatomic,strong) NSString *chooseRequest_ID_String;;

@property (strong, nonatomic) NSString *createdByString;
@property (strong, nonatomic) NSString *createdDateString;
@property (strong, nonatomic) NSString *statusString;

@property (strong, nonatomic) NSMutableArray *attendeesArray;
@property (strong, nonatomic) NSMutableArray *datesArray;
@property (strong, nonatomic) NSMutableArray *detailArray;
@property (strong, nonatomic) NSMutableArray *jobEventsArray;
@property (readwrite, nonatomic) BOOL isFromAttendees;
@property (readwrite, nonatomic) BOOL isFromlocation;

@property (readwrite, nonatomic) BOOL isDateView;
@property (readwrite, nonatomic) BOOL isWeekView;
@property (readwrite, nonatomic) BOOL isMonthView;

@property (strong, nonatomic) NSMutableDictionary *addNewJob_dictionary;

@end
