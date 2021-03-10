---
title: "Plugin CaDavALL"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- MailReader.java
    - Menu Importa Mail_Import Mail
    - Menu Crea Associazione Mail_MailCmdKey
- SyncCaldav_IdempiereToProvider.java
    - Menu Sincronizzazione Calendario da iDempiere [CALDAV01]_Caldav_IdempiereToProvider
- SyncCaldav_ProviderToIdempiere.java
    - Menu Sincronizzazione Calendario da Server [CALDAV02]_Caldav_ProviderToIdempiere
## Model
- MCaldavParam.java
    - getCalParamForWindow(Properties, int, int):List<MCaldavParam>
    - dateByColumn(int, PO):Timestamp
    - getTitleAndDescrForEvent(PO):Hashtable<String, String>
    - getTmp_dateEvent():Timestamp
    - getUserForCalendar():List<MUser>
    - getUserForCalendarByClient(int):List<MUser>
    - parseCondition(String, PO):String
    - parseTime(String):String
    - setTimeAndaddTime(PO):ArrayList<Timestamp>
    - setTmp_dateEvent(Timestamp):void
    - textCalMessage(PO):String
- MCaldavSync.java
    - getCalSync(int, int, int):MCaldavSync
    - isSynchronized(int, int, int):boolean
    - getListSyncUser():Lista<MCaldavSyncUser>
    - setSyncUserCalendarID(HashMap<Integer, String>):void
    - syncUser(int):void
- MCaldavSyncUser.java
    - No methods, only constructors
- MServices.java
    - No methods, only constructors
- MUserMail.java
    - getMaxDate(int):Timestamp
    - presentMessageID(String):boolean
## InfoWindow

## Callout
- Package LIT_CaDavALL.mailreader.callout
    - Call_CreateFolderMail.java
        - start(Properties, int, GridTab, GridField, Object, Object):String
        
- it.idIta.idempiere.LIT_CaDavALL.mailReader.callout.Call_CreateFolderMail
    - Call_CreateFolderMail
        - TableName: AD_User
        - ColumnName: LIT_CreateFolderMail

## EventHandler

## Form

