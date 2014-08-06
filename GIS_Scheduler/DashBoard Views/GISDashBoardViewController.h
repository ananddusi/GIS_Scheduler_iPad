//
//  GISDashBoardViewController.h
//  GIS_Scheduler
//
//  Created by Paradigm on 09/07/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GISAppDelegate.h"
#import "GISSchedulerSPJobsStore.h"
#import "GISSchedulerNMRequestsStore.h"

@interface GISDashBoardViewController : UIViewController<UISplitViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIView *datListView;
    //IBOutlet UILabel *_Label;
    IBOutlet UILabel *accountName_Label;
    IBOutlet UILabel *requestID_Label;
    IBOutlet UILabel *eventType_Label;
    IBOutlet UILabel *otherServices_Label;
    IBOutlet UILabel *earliestDate_Label;
    IBOutlet UILabel *approvalDate_Label;
    IBOutlet UILabel *approvedBy_Label;
    IBOutlet UILabel *status_Label;
    IBOutlet UILabel *scheduler_Label;
    IBOutlet UILabel *newIncomingRequest_Count_Label;
    IBOutlet UILabel *requestForModification_Count_Label;
    IBOutlet UILabel *serviceProvReqJobs_Count_Label;
    IBOutlet UILabel *newRequest_Label;
    IBOutlet UILabel *inProgress_Label;
    IBOutlet UILabel *onHold_Label;
    IBOutlet UILabel *waitingForApproval_Label;
    IBOutlet UILabel *approvedRequest_Label;
    IBOutlet UILabel *incompleteRequest_Label;
    
    IBOutlet UIView *dashBoard_UIView;
    IBOutlet UIView *tableHeader1_UIView;
    IBOutlet UIView *tableHeader2_UIView;
    IBOutlet UIView *tableHeader3_UIView;
    
    IBOutlet UIView *colorIndicator_UIView;
    IBOutlet UISegmentedControl *segmentedControl_;
    
    IBOutlet UITableView *listTableView;
    
    IBOutlet UILabel *accountNameReq_Label;
    IBOutlet UILabel *requestIDReq_Label;
    IBOutlet UILabel *eventTypeReq_Label;
    IBOutlet UILabel *otherServicesReq_Label;
    IBOutlet UILabel *submissionDateReq_Label;
    IBOutlet UILabel *earlierDateReq_Label;
    IBOutlet UILabel *statusReq_Label;
    IBOutlet UILabel *schedulerReq_Label;
    
    IBOutlet UILabel *jobNameSP_Label;
    IBOutlet UILabel *jobDateSP_Label;
    IBOutlet UILabel *startTimeSP_Label;
    IBOutlet UILabel *endTimeSP_Label;
    IBOutlet UILabel *totalHoursSP_Label;
    IBOutlet UILabel *eventtypeSP_Label;
    IBOutlet UILabel *serviceProviderSP_Label;
    IBOutlet UILabel *requestedDateSP_Label;
    IBOutlet UILabel *payTypeSP_Label;
    IBOutlet UILabel *gisResponseSP_Label;
    
    GISSchedulerSPJobsStore *spJobsStore;
    GISSchedulerNMRequestsStore *nmRequestStore;
    NSMutableArray *SPJobsArray;
    NSMutableArray *NMRequestsArray;
    GISAppDelegate *appDelegate;
    
    
}
- (IBAction)hideAndUnHideMaster:(id)sender;
-(IBAction)SegmentToggle:(UISegmentedControl*)sender;
@property(nonatomic,strong)IBOutlet UINavigationItem *navigation_item;
@property(nonatomic,readwrite) BOOL isMasterHide;
@property(nonatomic,strong)IBOutlet UINavigationBar *navigationBar;

-(void)pushToViewController:(int)section rowValue:(int)row;

@end
