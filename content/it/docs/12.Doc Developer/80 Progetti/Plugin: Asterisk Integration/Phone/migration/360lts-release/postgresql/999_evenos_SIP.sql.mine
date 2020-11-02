-- 19.01.2010 00:39:31 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE ad_system ADD COLUMN siphost VARCHAR(32); ALTER TABLE ad_system ADD COLUMN sipuser VARCHAR(32); ALTER TABLE ad_system ADD COLUMN sippassword VARCHAR(32); ALTER TABLE ad_system ADD COLUMN sipcontext VARCHAR(32)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,1000000,0,'SIPHost',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','SIP Host','SIP Host',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=1000000 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,1000000,1000000,0,10,531,'SIPHost',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U',32,'Y','N','N','N','N','N','N','N','Y','N','Y','SIP Host',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=1000000 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_system','SIPHost','VARCHAR(32)',null,'NULL')
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,1000001,0,'SIPUser',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','SIP User','SIP User',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=1000001 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,1000001,1000001,0,10,531,'SIPUser',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U',32,'Y','N','N','N','N','N','N','N','Y','N','Y','SIP User',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=1000001 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_system','SIPUser','VARCHAR(32)',null,'NULL')
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,1000002,0,'SIPPassword',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','SIP Password','SIP Password',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=1000002 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,1000002,1000002,0,10,531,'SIPPassword',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U',32,'Y','N','N','N','N','N','N','N','Y','N','Y','SIP Password',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=1000002 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19.01.2010 00:39:32 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_system','SIPPassword','VARCHAR(32)',null,'NULL')
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,1000003,0,'SIPContext',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','SIP Context','SIP Context',TO_TIMESTAMP('2010-01-19 00:39:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=1000003 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,1000003,1000003,0,10,531,'SIPContext',TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,'U',32,'Y','N','N','N','N','N','N','N','Y','N','Y','SIP Context',TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=1000003 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_system','SIPContext','VARCHAR(32)',null,'NULL')
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup (AD_Client_ID,AD_FieldGroup_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,IsCollapsedByDefault,Name,Updated,UpdatedBy) VALUES (0,1000000,0,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','N','SIP configuration',TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup_Trl (AD_Language,AD_FieldGroup_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_FieldGroup_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_FieldGroup t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_FieldGroup_ID=1000000 AND NOT EXISTS (SELECT * FROM AD_FieldGroup_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_FieldGroup_ID=t.AD_FieldGroup_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,1000000,1000000,1000000,0,440,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,20,'U','Y','Y','Y','N','N','N','N','SIP Host',290,0,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=1000000 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,1000001,1000000,1000001,0,440,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,20,'U','Y','Y','Y','N','N','N','Y','SIP User',300,0,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=1000001 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,1000003,1000000,1000002,0,440,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,20,'U','Y','Y','Y','N','N','N','N','SIP Context',310,0,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=1000002 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,1000002,1000000,1000003,0,440,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100,20,'U','Y','Y','Y','N','N','N','Y','SIP Password',320,0,TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=1000003 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element SET ColumnName='IsInPayroll', Description='Defined if any User Contact will be used for Calculate Payroll', EntityType='EE02', Help=NULL, IsActive='Y', Name='Is In Payroll', PO_Description=NULL, PO_Help=NULL, PO_Name=NULL, PO_PrintName=NULL, PrintName='Is In Payroll',Updated=TO_TIMESTAMP('2010-01-19 00:39:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=53676
;

-- 19.01.2010 00:39:33 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=53676
;

-- 19.01.2010 00:39:34 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET AD_Element_ID=53676, AD_Process_ID=NULL, AD_Reference_ID=20, AD_Reference_Value_ID=NULL, AD_Table_ID=114, AD_Val_Rule_ID=NULL, Callout=NULL, ColumnName='IsInPayroll', ColumnSQL=NULL, DefaultValue=NULL, Description='Defined if any User Contact will be used for Calculate Payroll', EntityType='EE02', FieldLength=1, Help=NULL, InfoFactoryClass=NULL, IsActive='Y', IsAlwaysUpdateable='N', IsIdentifier='N', IsKey='N', IsMandatory='N', IsParent='N', IsSelectionColumn='N', IsSyncDatabase='Y', IsTranslated='N', IsUpdateable='Y', Name='Is In Payroll', ReadOnlyLogic=NULL, Version=0, VFormat=NULL,Updated=TO_TIMESTAMP('2010-01-19 00:39:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=56294
;

-- 19.01.2010 00:39:34 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET Name='Is In Payroll', Description='Defined if any User Contact will be used for Calculate Payroll', Help=NULL WHERE AD_Column_ID=56294 AND IsCentrallyMaintained='Y'
;

-- 19.01.2010 00:39:34 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_user','IsInPayroll','CHAR(1)',null,'NULL')
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO t_alter_column values('ad_user','IsInPayroll',null,'NULL',null)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,1000004,0,'SIPChannel',TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','SIP Channel','SIP Channel',TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=1000004 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAlwaysUpdateable,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,Updated,UpdatedBy,Version) VALUES (0,1000004,1000004,0,10,114,'SIPChannel',TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100,'U',32,'Y','N','N','N','N','N','N','N','Y','N','Y','SIP Channel',TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=1000004 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE AD_User ADD COLUMN SIPChannel VARCHAR(32) DEFAULT NULL 
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,1000004,121,1000004,0,118,TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100,0,'U','Y','Y','Y','N','N','N','N','SIP Channel',270,0,TO_TIMESTAMP('2010-01-19 00:39:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19.01.2010 00:39:35 MEZ
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=1000004 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

