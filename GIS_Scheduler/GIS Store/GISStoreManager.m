//
//  GISStoreManager.m
//  Gallaudet-Interpreting-Service
//
//  Created by Paradigm on 05/05/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#import "GISStoreManager.h"

@interface GISStoreManager ()
@property (nonatomic, retain) NSMutableArray *loginArray;

@property (nonatomic, retain) NSMutableArray *buildingnamesArray;
@property (nonatomic, retain) NSMutableArray *dressCodeArray;
@property (nonatomic, retain) NSMutableArray *locatioCodeArray;
@property (nonatomic, retain) NSMutableArray *eventTypeArray;
@property (nonatomic, retain) NSMutableArray *unitOrDepArray;
@property (nonatomic, retain) NSMutableArray *billingDataArray;

@property (nonatomic, retain) NSMutableArray *requestNumbersArray;
@property (nonatomic, retain) NSMutableArray *requestNumbers_SearchJObsArray;
@property (nonatomic, retain) NSMutableArray *requestDetailsArray;

@property (nonatomic, retain) NSMutableArray *contactsInfoArray;

@property (nonatomic, retain) NSMutableArray *chooseRequestDetailsArray;

@property (nonatomic, retain) NSMutableArray *modeOfCommunicationArray;

@property (nonatomic, retain) NSMutableArray *serviceProviderGenderPrefernceArray;
@property (nonatomic, retain) NSMutableArray *serviceNeededArray;

@property (nonatomic, retain) NSMutableArray *attendees_Details_Array;

@property (nonatomic, retain) NSMutableArray *closestMetroArray;

@property (nonatomic, retain) NSMutableArray *datesTimes_detail_Array;
@property (nonatomic, retain) NSMutableArray *location_name_Array;
@property (nonatomic, retain) NSMutableArray *primaryAudience_Array;
@property (nonatomic, retain) NSMutableArray *searchRequestJobs_Array;

@property (nonatomic, retain) NSMutableArray *viewSchedule_Array;
@property (nonatomic, retain) NSMutableArray *skillLevel_Array;
@property (nonatomic, retain) NSMutableArray *payLevel_Array;
@property (nonatomic, retain) NSMutableArray *serviceType_ServiceProvider_Array;
@property (nonatomic, retain) NSMutableArray *registeredCOnsumers_Array;

@end


@implementation GISStoreManager
static GISStoreManager *singletonManager = nil;

+ (GISStoreManager *)sharedManager
{
    if (singletonManager == nil) {
        singletonManager = [[self alloc]init];
    }
    return singletonManager;
}

- (id)init {
    if ([super init]) {
        _loginArray = [[NSMutableArray alloc]init];

        _buildingnamesArray = [[NSMutableArray alloc]init];
        _dressCodeArray = [[NSMutableArray alloc]init];
        _locatioCodeArray = [[NSMutableArray alloc]init];
        _eventTypeArray = [[NSMutableArray alloc]init];
        _unitOrDepArray = [[NSMutableArray alloc]init];
        _billingDataArray = [[NSMutableArray alloc]init];
        _requestNumbersArray = [[NSMutableArray alloc]init];
        _requestDetailsArray = [[NSMutableArray alloc]init];
        _contactsInfoArray = [[NSMutableArray alloc]init];
        _chooseRequestDetailsArray = [[NSMutableArray alloc]init];
        
        _modeOfCommunicationArray = [[NSMutableArray alloc]init];
        _serviceNeededArray = [[NSMutableArray alloc]init];
        _serviceProviderGenderPrefernceArray = [[NSMutableArray alloc]init];
        _attendees_Details_Array = [[NSMutableArray alloc]init];
        _closestMetroArray = [[NSMutableArray alloc]init];
        _datesTimes_detail_Array= [[NSMutableArray alloc]init];
        _location_name_Array= [[NSMutableArray alloc]init];
        _primaryAudience_Array= [[NSMutableArray alloc]init];
        
        _searchRequestJobs_Array= [[NSMutableArray alloc]init];
        
        _viewSchedule_Array= [[NSMutableArray alloc]init];
        _skillLevel_Array= [[NSMutableArray alloc]init];
        _payLevel_Array= [[NSMutableArray alloc]init];
        _serviceType_ServiceProvider_Array= [[NSMutableArray alloc]init];
        _registeredCOnsumers_Array= [[NSMutableArray alloc]init];
        
        _requestNumbers_SearchJObsArray= [[NSMutableArray alloc]init];
        
        
    }
    return self;
}

#pragma mark Login Start
- (BOOL)addLoginObject:(GISLoginDetailsObject*)loginObject
{
    BOOL isAdded = FALSE;
    if (loginObject != nil) {
        [_loginArray addObject:loginObject];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getLoginObjects
{
    return [_loginArray count]?_loginArray:nil;
}
- (void)removeLoginObjects
{
    [_loginArray removeAllObjects];
}


- (BOOL)addBuildingNameObject:(GISDropDownsObject *)buildingNameObj
{
    BOOL isAdded = FALSE;
    if (buildingNameObj != nil) {
        [_buildingnamesArray addObject:buildingNameObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getBuildingNameObjects
{
    return [_buildingnamesArray count]?_buildingnamesArray:nil;
}
- (void)removeBuildingNameObjects
{
    [_buildingnamesArray removeAllObjects];
}
#pragma mark BuldingNames END

#pragma mark DressCode Start
- (BOOL)addDressCodeObject:(GISDropDownsObject *)dressCodeObj
{
    BOOL isAdded = FALSE;
    if (dressCodeObj != nil) {
        [_dressCodeArray addObject:dressCodeObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getDressCodeObjects
{
    return [_dressCodeArray count]?_dressCodeArray:nil;
}
- (void)removeDressCodeObjects
{
    [_dressCodeArray removeAllObjects];
}
#pragma mark DressCode END

#pragma mark LocationCode Start
- (BOOL)addLocationCodeObject:(GISDropDownsObject *)locationCodeObj
{
    BOOL isAdded = FALSE;
    if (locationCodeObj != nil) {
        [_locatioCodeArray addObject:locationCodeObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getLocationCodeObjects
{
    return [_locatioCodeArray count]?_locatioCodeArray:nil;
}
- (void)removeLocationCodeObjects
{
    [_locatioCodeArray removeAllObjects];
}
#pragma mark LocationCode END

#pragma mark EventType Start
- (BOOL)addEventTypeObject:(GISDropDownsObject *)eventTypeObj
{
    BOOL isAdded = FALSE;
    if (eventTypeObj != nil) {
        [_eventTypeArray addObject:eventTypeObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getEventTypeObjects
{
    return [_eventTypeArray count]?_eventTypeArray:nil;
}
- (void)removeEventTypeObjects
{
    [_eventTypeArray removeAllObjects];
}
#pragma mark EventType END

#pragma mark Unit/Department Start
- (BOOL)addUnitOrDepartmentObject:(GISDropDownsObject *)unitOrDepartmentObj
{
    BOOL isAdded = FALSE;
    if (unitOrDepartmentObj != nil) {
        [_unitOrDepArray addObject:unitOrDepartmentObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getUnitOrDepartmentObjects
{
    return [_unitOrDepArray count]?_unitOrDepArray:nil;
}
- (void)removeUnitOrDepartmentObjects
{
    [_unitOrDepArray removeAllObjects];
}
#pragma mark Unit/Department END

#pragma mark Billing Data Start
- (BOOL)addBillingDataObject:(GISBilingDataObject *)billingDataObj
{
    BOOL isAdded = FALSE;
    if (billingDataObj != nil) {
        [_billingDataArray addObject:billingDataObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getBillingDataObject
{
    return [_billingDataArray count]?_billingDataArray:nil;
}
- (void)removeBillingDataObjects
{
    [_billingDataArray removeAllObjects];
}
#pragma mark Billing Data END




#pragma mark RequestNumbers Start
- (BOOL)addRequestNumbersObject:(GISDropDownsObject *)requestNumbersObject
{
    BOOL isAdded = FALSE;
    if (requestNumbersObject != nil) {
        [_requestNumbersArray addObject:requestNumbersObject];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getRequestNumbersObjects
{
    return [_requestNumbersArray count]?_requestNumbersArray:nil;
}
- (void)removeRequestNumbersObjects
{
    [_requestNumbersArray removeAllObjects];
}
#pragma mark RequestNumbers END

#pragma mark GetRequest Details Start
- (BOOL)addRequestDetailsObject:(GISBilingDataObject *)requestDetails
{
    BOOL isAdded = FALSE;
    if (requestDetails != nil) {
        [_requestDetailsArray addObject:requestDetails];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getRequestDetailsObject
{
    return [_requestDetailsArray count]?_requestDetailsArray:nil;
}
- (void)removeRequestDetailsObjects
{
    [_requestDetailsArray removeAllObjects];
}
#pragma mark GetRequest Details END


#pragma mark Contacts Data Start
- (BOOL)addContactsInfoObject:(GISContactsInfoObject *)contactsObj
{
    BOOL isAdded = FALSE;
    if (contactsObj != nil) {
        [_contactsInfoArray addObject:contactsObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getContactsInfoObjects
{
    return [_contactsInfoArray count]?_contactsInfoArray:nil;
}
- (void)removeContactsInfoObjects
{
    [_contactsInfoArray removeAllObjects];
}


- (BOOL)addChooseRequestDetailsObject:(GISChooseRequestDetailsObject *)chooseRequestDetailsObj
{
    BOOL isAdded = FALSE;
    if (chooseRequestDetailsObj != nil) {
        [_chooseRequestDetailsArray addObject:chooseRequestDetailsObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getChooseRequestDetailsObjects
{
    return [_chooseRequestDetailsArray count]?_chooseRequestDetailsArray:nil;
}
- (void)removeChooseRequestDetailsObjects
{
    [_chooseRequestDetailsArray removeAllObjects];
}

///
- (BOOL)addModeOfCommunicationObject:(GISDropDownsObject *)modeOfCommunicationObj
{
    BOOL isAdded = FALSE;
    if (modeOfCommunicationObj != nil) {
        [_modeOfCommunicationArray addObject:modeOfCommunicationObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getModeOfCommunicationObjects
{
    return [_modeOfCommunicationArray count]?_modeOfCommunicationArray:nil;
}
- (void)removeModeOfCommunicationObjects
{
    [_modeOfCommunicationArray removeAllObjects];
}

- (BOOL)addServiceProvGenderPrefObject:(GISDropDownsObject *)serviceProvGenderPrefObj
{
    BOOL isAdded = FALSE;
    if (serviceProvGenderPrefObj != nil) {
        [_serviceProviderGenderPrefernceArray addObject:serviceProvGenderPrefObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getServiceProvGenderPrefObjects
{
    return [_serviceProviderGenderPrefernceArray count]?_serviceProviderGenderPrefernceArray:nil;
}
- (void)removeServiceProvGenderPrefObjects
{
    [_serviceProviderGenderPrefernceArray removeAllObjects];
}

- (BOOL)addServiceNeededObject:(GISDropDownsObject *)serviceNeededObj
{
    BOOL isAdded = FALSE;
    if (serviceNeededObj != nil) {
        [_serviceNeededArray addObject:serviceNeededObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getServiceNeededObjects
{
    return [_serviceNeededArray count]?_serviceNeededArray:nil;
}
- (void)removeServiceNeededObjects
{
    [_serviceNeededArray removeAllObjects];
}


- (BOOL)addPrimaryAudienceObject:(GISDropDownsObject *)PrimaryAudience{
    BOOL isAdded = FALSE;
    if (PrimaryAudience != nil) {
        [_primaryAudience_Array addObject:PrimaryAudience];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getPrimaryAudienceObjects
{
    return [_primaryAudience_Array count]?_primaryAudience_Array:nil;
}
- (void)removePrimaryAudienceObjects
{
    [_primaryAudience_Array removeAllObjects];
}

- (BOOL)addAttendees_Details_Object:(GISAttendees_ListObject *)attendees_Details_Obj
{
    BOOL isAdded = FALSE;
    if (attendees_Details_Obj != nil) {
        [_attendees_Details_Array addObject:attendees_Details_Obj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getAttendees_Details_Objects
{
    return [_attendees_Details_Array count]?_attendees_Details_Array:nil;
}
- (void)removeAttendees_Details_Objects
{
    [_attendees_Details_Array removeAllObjects];
}

- (BOOL)addClosestmetroObject:(GISDropDownsObject *)ClosestmetroObj
{
    BOOL isAdded = FALSE;
    if (ClosestmetroObj != nil) {
        [_closestMetroArray addObject:ClosestmetroObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getClosestmetroObjects
{
    return [_closestMetroArray count]?_closestMetroArray:nil;
}
- (void)removeClosestmetroObjects
{
    [_closestMetroArray removeAllObjects];
}

- (BOOL)addLocationNameObject:(GISDropDownsObject *)LocationNameObj
{
    BOOL isAdded = FALSE;
    if (LocationNameObj != nil) {
        [_location_name_Array addObject:LocationNameObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getLocationNameObjects
{
    return [_location_name_Array count]?_location_name_Array:nil;
}
- (void)removeLocationNameObjects
{
    [_location_name_Array removeAllObjects];
}

- (BOOL)addSkillLevelObject:(GISDropDownsObject *)SkillLevelObj
{
    BOOL isAdded = FALSE;
    if (SkillLevelObj != nil) {
        [_skillLevel_Array addObject:SkillLevelObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getSkillLevelObjects
{
    return [_skillLevel_Array count]?_skillLevel_Array:nil;
}
- (void)removeSkillLevelObjects
{
    [_skillLevel_Array removeAllObjects];
}


- (BOOL)addPayLevelObject:(GISDropDownsObject *)PayLevelObj
{
    BOOL isAdded = FALSE;
    if (PayLevelObj != nil) {
        [_payLevel_Array addObject:PayLevelObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getPayLevelObjects
{
    return [_payLevel_Array count]?_payLevel_Array:nil;
}
- (void)removePayLevelObjects
{
    [_payLevel_Array removeAllObjects];
}

- (BOOL)addServiceType_ServiceProviderObject:(GISDropDownsObject *)ServiceType_ServiceProviderObj
{
    
    BOOL isAdded = FALSE;
    if (ServiceType_ServiceProviderObj != nil) {
        [_serviceType_ServiceProvider_Array addObject:ServiceType_ServiceProviderObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getServiceType_ServiceProviderObjects
{
    return [_serviceType_ServiceProvider_Array count]?_serviceType_ServiceProvider_Array:nil;
}
- (void)removeServiceType_ServiceProviderObjects
{
    [_serviceType_ServiceProvider_Array removeAllObjects];
}

- (BOOL)addRegisteredConsumersObject:(GISDropDownsObject *)registeredConsumersObj
{
    
    BOOL isAdded = FALSE;
    if (registeredConsumersObj != nil) {
        [_registeredCOnsumers_Array addObject:registeredConsumersObj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getRegisteredConsumersObjects
{
    return [_registeredCOnsumers_Array count]?_registeredCOnsumers_Array:nil;
}
- (void)removeRegisteredConsumersObjects
{
    [_registeredCOnsumers_Array removeAllObjects];
}


- (BOOL)addDateTimes_detail_Object:(GISDatesAndTimesObject *)dateTimes_detail_Obj
{
    BOOL isAdded = FALSE;
    if (dateTimes_detail_Obj != nil) {
        [_datesTimes_detail_Array addObject:dateTimes_detail_Obj];
        isAdded = TRUE;
    }
    return isAdded;
}
- (NSMutableArray *)getDateTimes_detail_Objects
{
    return [_datesTimes_detail_Array count]?_datesTimes_detail_Array:nil;
}
- (void)removeDateTimes_detail_Objects
{
    [_datesTimes_detail_Array removeAllObjects];
}



- (BOOL)addSearchRequestJobsObject:(GISSearchReqObject *)searchRequestJobsObj
{
    BOOL isAdded = FALSE;
    if (searchRequestJobsObj != nil) {
        [_searchRequestJobs_Array addObject:searchRequestJobsObj];
        isAdded = TRUE;
    }
    return isAdded;
}

- (BOOL)addViewSchedule_Details_Object:(GISViewScheduleObject *)viewSchedule_Details_Obj
{
    BOOL isAdded = FALSE;
    if (viewSchedule_Details_Obj != nil) {
        [_viewSchedule_Array addObject:viewSchedule_Details_Obj];
        isAdded = TRUE;
    }
    return isAdded;
}


- (NSMutableArray*)getSearchRequestJobsObjects
{
    return [_searchRequestJobs_Array count]?_searchRequestJobs_Array:nil;
}
- (void)removeSearchRequestJobsObjects
{
    [_searchRequestJobs_Array removeAllObjects];
}

- (NSMutableArray *)getViewSchedule_Objects
{
    return [_viewSchedule_Array count]?_viewSchedule_Array:nil;
}
- (void)removeViewSchedule_Objects
{
    [_viewSchedule_Array removeAllObjects];
}

#pragma mark RequestNumbers SearchJobs Start
- (BOOL)addRequestNumbers_SearchJobsObject:(GISDropDownsObject *)requestNumbers_SearchJobsObject
{
    BOOL isAdded = FALSE;
    if (requestNumbers_SearchJobsObject != nil) {
        [_requestNumbers_SearchJObsArray addObject:requestNumbers_SearchJobsObject];
        isAdded = TRUE;
    }
    return isAdded;
}

- (NSMutableArray*)getRequestNumbers_SearchJobsObjects
{
    return [_requestNumbers_SearchJObsArray count]?_requestNumbers_SearchJObsArray:nil;
}
- (void)removeRequestNumbers_SearchJobsObjects
{
    [_requestNumbers_SearchJObsArray removeAllObjects];
}


- (void)destroy{
    
}


#pragma mark Login END

@end