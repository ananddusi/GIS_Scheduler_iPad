//
//  GISServerManager.h
//  Gallaudet-Interpreting-Service
//
//Created by Paradigm on 02/05/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GISProperties.h"

@class GISRequest;

@interface GISServerManager : NSObject

{
    NSMutableArray *requests;
}

+ (GISServerManager*)sharedManager;
- (void)destroy;

- (void)queueRequest:(GISRequest *)request;
- (void)removeRequest:(GISRequest *)request;

- (void)cancelAll;

- (void)logininForTarget:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;
- (void)getDropDownData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getBillingsData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getRequestNumbersData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getChooseRequestDetailsData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getContactsData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveUpdateRequestData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveEventDetailsData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveAttendeesData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveDateTimeData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getAttendees_Details_Data:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveLocationData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)saveUpdateUnavailableTime:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getEventDetailsData:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getDateTimeDetails:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getLocation_Details_Data:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getoffCampusLocation_Details_Data:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getDeleteRequest:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getMyAssignedJobs:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getSearchRequestNumbers:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)searchRequestJobs:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;


- (void)getviewSchedule:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getSchedule_ServiceProvider:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)searchJobs_serviceProvider:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)submitTimeSheet:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)submitForRequest:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

- (void)getSchedulerRequestedJobs:(id)target withParams:(NSMutableDictionary *)params finishAction:(SEL)finishAction failAction:(SEL)failAction;

@end