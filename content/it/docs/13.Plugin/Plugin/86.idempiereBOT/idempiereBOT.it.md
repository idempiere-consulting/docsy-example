---
title: "Plugin idempiereBOT"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

## Processi
- ProcessFactory_idIta.java
    - DATA REQUIRED
- PublishMsgSMSProcess.java
    - NO PROCESS FOUND!!
- PublishMsgTelegramProcess.java
    - NO PROCESS FOUND!!
## Model
- MLITAlertRule.java
    - getLines():MLITAlertRuleWhClause[]
    - getLines(boolean):MLITAlertRuleWhClause[]
    - getLines(String):MLITAlertRuleWhClause[]
- MLITAlertRuleWhClause.java
    - beforeSave(boolean):boolean
- MSMSBroadMsg.java
    - No methods, only constructors
- MTelegramAccess.java
    - getRole():MRole
    - isHuman():boolean
    - isOrganization():boolean
    - isRole():boolean
- MTelegramADClient.java
    - getBots(int):List<X_LIT_Telegram_AD_Client>
- MTelegramBot.java
    - getMethodsByAction(String, Object...):MTelegramBot[]
    - getListAccess():ArrayList<MTelegramAccess>
    - getListCmdKeys():TreeMap<String, MTelegramCommandKey>
    - getToAccessData(int):MTelegramAccess
    - isOKAccessMethod(int):boolean
- MTelegramBroadMsg.java
    - No methods, only constructors
- MTelegramCommandKey.java
    - No methods, only constructors
- MTelegramRequest.java
    - userAccess(String, String): MTelegramRequest
## InfoWindow

## Callout

## EventHandler

## Form

