---
title: "Plugin PostIt"
date: 2020-04-24T22:47:10+02:00
draft: false
weight : 721
pre: "<b>721. </b>"
---

[Vai alla Pagina di Installazione]({{< ref "Budget[BDG00].md" >}} "Installazione Plugin Budget")

## Processi
- ProcessFactory_cnet.java !!

## Model
- MLIT_PostIt.java
    - getPostItForWindow(Properties, int, int ,int): List<MLIT_PostIt>
    - loadPostIts():void
- ModelValidatorFact_cnet.java
    - newModelValidatorInstance(String): ModelValidator
## Infowindow
no

## Callout
- CallCopyText.java
    - start(Properties, int, GridTab, GridField, Obkect,Object) : String
- CalloutPostIt.java
    - parseQueryCustomize(Properties, String, GridField, Object) : String
    - postIt_call(Properties, int, GridTab, GridField, Object) : String
    - setMethodOnList(MLIT_PostIt, String, Method, TreeMap<String, T>) <String, T> : void
- CalloutSpecialField.java
    - start(Properties, int, GridTab, GridField, Object,Object) : String
    
iDempiere Callout
    
## Eventhandler
no
