---
title: "Plugin CaDav"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- CaDav
    - CalDav_Connect.java !!
    - CalDav_SyncKerioIdempiere.java !!
    - CardDav_Cnet.java !!
    - CardDav_Connect.java
        - Menu Sincronizzazione Contatti da iDempiere [CARDAV01]_Cardav_Sync
        - Menu Sincronizzazione Contatti da Server [CARDAV02]_Cardav_Sync_Kerio
    - CDav_Cnet.java !!
    - Task_SyncKerioIdempiere.java !!
- CaDav.mailReader
    - FetchingEmail.java !!
    - GetMail !!
    - MailCommandKeyProcess.java
        - Menu Crea Associazione Mail_MailCmdKey
    - MailReader.java
        - Menu Importa Mail_Import Mail
        - Menu Crea Associazione Mail_MailCmdKey

## Model
- CaDav
    - MCaldavComandKey.java
        - listCommandKey(int) : List<MCaldavComandKey>
    - MCaldavParam.java
        - getCalParamForWindow(Properties, int, int ,int) : List <MCaldavParam>
        - getTitleAndDescrForEvent(PO) : Hashtable <String, String>
        - textCalMessage(PO) : String
    - MCaldavSync.java
        - getCalSync(int, int, int) : MCaldavSync
        - isSynchronized(int, int, int) : boolean
    - MMailCommandKey.java
        - getListAccess(): ArrayList <MUserMailCmdKey>
        - isOkAccessCmd(int) : boolean
    - MUserCaldavParam.java
    - MUserContactTGroup.java
    - MuserMail.java
        - getMaxDate(int) : Timestamp
        - presentMessageID(String): boolean
    - MUserMailCmdKey.java
        - getRole() : MRole
        - isHuman(): boolean
        - isOrganization() : boolean
        - isRole() : boolean
        
## Infowindow


## Callout
- CaDav
    - CalloutSpecialField.java
        - start(Properties, int, GridTab, GridField, Object, Object) : String
- CaDav.mailReader
    - CreateFolderMail.java
        - start (Properties, int, GridTab, GridField, Object, Object) : String
        
## Eventhandler
- CaDav_EventHandler.java
    - createEvent(MCaldavParam) : void
    - createVCalendar(CDav_Cnet, String, MCaldavParam, int) : boolean
    - deleteEvent(MCaldavParam) : void
    - doHandleEvent(Event) : void
    - initialize() : void
    - setPrincipalCalendar(String) : void
    - setTimeWith_addTime(Timestamp, Timestamp, String, PO): void
    
    
    
