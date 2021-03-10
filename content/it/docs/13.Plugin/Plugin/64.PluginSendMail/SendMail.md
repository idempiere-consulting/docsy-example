---
title: "Plugin Send Mail"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- AppendMail_ForIntArea.java
    - Access Append Mail for Interest Area_AppendMail_InterestArea
- SendMail_ForIntArea.java
    - Info Send Mail for Interest Area_SendMail_InterestArea

## Model
- MAlert_StepOver.java
    - getRecipientUser(): Collection<Integer>
    - getSqlForBreak(MAlertRule,String) : String
- MSendEmailParam.java
    - get(Properties, int) : MSendEmailParam
    - getForInterestArea(int, boolean): MSendEmailParam

## Infowindow
no

## Callout
- CreateReport.java
    - initDocument(GridTab, String, Integer) : File
    
## Eventhandler
no 


