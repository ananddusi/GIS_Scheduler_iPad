//
//  GISDatabaseConstants.h
//  Gallaudet-Interpreting-Service
//
//  Created by Anand on 14/05/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#ifndef Gallaudet_Interpreting_Service_GISDatabaseConstants_h
#define Gallaudet_Interpreting_Service_GISDatabaseConstants_h

#define CREATE_TBL_LOGIN @"CREATE TABLE IF NOT EXISTS TBL_LOGIN(REQUESTOR_ID TEXT PRIMARY KEY,EMAIL TEXT,FIRST_NAME TEXT,LAST_NAME TEXT,REQUEST_TOKEN TEXT,USER_STATUS TEXT,ROLES TEXT,ROLE_ID TEXT)"

#define CREATE_TBL_BUILDING_NAME @"CREATE TABLE IF NOT EXISTS TBL_BUILDING_NAME(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_GENERAL_LOCATION @"CREATE TABLE IF NOT EXISTS TBL_GENERAL_LOCATION(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_EVENT_TYPE @"CREATE TABLE IF NOT EXISTS TBL_EVENT_TYPE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_DRESS_CODE @"CREATE TABLE IF NOT EXISTS TBL_DRESS_CODE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_UNIT_DEPARTMENT @"CREATE TABLE IF NOT EXISTS TBL_UNIT_DEPARTMENT(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"
///
#define CREATE_TBL_MODE_OF_COMMUNICATION @"CREATE TABLE IF NOT EXISTS TBL_MODE_OF_COMMUNICATION(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_SERVICE_PROV_GENDER_PREFERENCE @"CREATE TABLE IF NOT EXISTS TBL_SERVICE_PROV_GENDER_PREFERENCE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_SERVICE_NEEDED @"CREATE TABLE IF NOT EXISTS TBL_SERVICE_NEEDED(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_CHOOSE_REQUEST @"CREATE TABLE IF NOT EXISTS TBL_CHOOSE_REQUEST(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_CLOSEST_METRO @"CREATE TABLE IF NOT EXISTS TBL_CLOSEST_METRO(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_CONTACTS_INFO @"CREATE TABLE IF NOT EXISTS TBL_CONTACTS_INFO(CONTACT_INFO_ID TEXT PRIMARY KEY, CONTACT_NO TEXT,CONTACT_TYPE TEXT,CONTACT_TYPE_ID TEXT,CONTACT_TYPE_NO TEXT)"

#define CREATE_TBL_SKILL_LEVEL @"CREATE TABLE IF NOT EXISTS TBL_SKILL_LEVEL(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_PAY_LEVEL @"CREATE TABLE IF NOT EXISTS TBL_PAY_LEVEL(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_SERVICE_TYPE_SERVICE_PROVIDER @"CREATE TABLE IF NOT EXISTS TBL_SERVICE_TYPE_SERVICE_PROVIDER(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#define CREATE_TBL_REGISTERED_CONSUMERS @"CREATE TABLE IF NOT EXISTS TBL_REGISTERED_CONSUMERS(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"
#define CREATE_TBL_PRIMARY_AUDIENCE @"CREATE TABLE IF NOT EXISTS TBL_PRIMARY_AUDIENCE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"


#define CREATE_TBL_PAY_TYPE @"CREATE TABLE IF NOT EXISTS TBL_PAY_TYPE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"
#define CREATE_TBL_TYPE_OF_SERVICE @"CREATE TABLE IF NOT EXISTS TBL_TYPE_OF_SERVICE(ID TEXT PRIMARY KEY, TYPE TEXT,VALUE TEXT)"

#endif
