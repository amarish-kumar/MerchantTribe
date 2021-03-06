SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
PRINT N'Creating [dbo].[bvc_WebAppSetting]'
GO
CREATE TABLE [dbo].[bvc_WebAppSetting]
(
[SettingName] [nvarchar] (255) NOT NULL,
[SettingValue] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_WebAppSetting] on [dbo].[bvc_WebAppSetting]'
GO
ALTER TABLE [dbo].[bvc_WebAppSetting] ADD CONSTRAINT [PK_bvc_WebAppSetting] PRIMARY KEY CLUSTERED  ([SettingName])
GO
PRINT N'Creating [dbo].[bvc_RewardsPoints]'
GO
CREATE TABLE [dbo].[bvc_RewardsPoints]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[UserId] [nvarchar] (50) NOT NULL,
[Points] [int] NOT NULL,
[PointsHeld] [int] NOT NULL,
[TransactionTime] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_RewardsPoints] on [dbo].[bvc_RewardsPoints]'
GO
ALTER TABLE [dbo].[bvc_RewardsPoints] ADD CONSTRAINT [PK_bvc_RewardsPoints] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_RewardsPoints] on [dbo].[bvc_RewardsPoints]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_RewardsPoints] ON [dbo].[bvc_RewardsPoints] ([UserId])
GO
PRINT N'Creating index [IX_bvc_RewardsPoints_1] on [dbo].[bvc_RewardsPoints]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_RewardsPoints_1] ON [dbo].[bvc_RewardsPoints] ([StoreId])
GO
PRINT N'Creating [dbo].[bvc_ProductXOption]'
GO
CREATE TABLE [dbo].[bvc_ProductXOption]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[ProductBvin] [nvarchar] (36) NOT NULL,
[OptionBvin] [nvarchar] (36) NOT NULL,
[SortOrder] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_ProductXOption] on [dbo].[bvc_ProductXOption]'
GO
ALTER TABLE [dbo].[bvc_ProductXOption] ADD CONSTRAINT [PK_bvc_ProductXOption] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_ProductXOption_ProductBvin] on [dbo].[bvc_ProductXOption]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductXOption_ProductBvin] ON [dbo].[bvc_ProductXOption] ([ProductBvin])
GO
PRINT N'Creating index [IX_bvc_ProductXOption_OptionBvin] on [dbo].[bvc_ProductXOption]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductXOption_OptionBvin] ON [dbo].[bvc_ProductXOption] ([OptionBvin])
GO
PRINT N'Creating [dbo].[bvc_ProductOptionsItems]'
GO
CREATE TABLE [dbo].[bvc_ProductOptionsItems]
(
[bvin] [varchar] (50) NOT NULL,
[StoreId] [bigint] NOT NULL,
[OptionBvin] [varchar] (50) NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[PriceAdjustment] [decimal] (18, 10) NOT NULL,
[WeightAdjustment] [decimal] (18, 10) NOT NULL,
[IsLabel] [bit] NOT NULL,
[SortOrder] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_ProductOptionsItems] on [dbo].[bvc_ProductOptionsItems]'
GO
ALTER TABLE [dbo].[bvc_ProductOptionsItems] ADD CONSTRAINT [PK_bvc_ProductOptionsItems] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductOptionsItems_1] on [dbo].[bvc_ProductOptionsItems]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductOptionsItems_1] ON [dbo].[bvc_ProductOptionsItems] ([StoreId])
GO
PRINT N'Creating index [IX_bvc_ProductOptionsItems] on [dbo].[bvc_ProductOptionsItems]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductOptionsItems] ON [dbo].[bvc_ProductOptionsItems] ([OptionBvin])
GO
PRINT N'Creating [dbo].[bvc_ProductOptions]'
GO
CREATE TABLE [dbo].[bvc_ProductOptions]
(
[bvin] [varchar] (50) NOT NULL,
[StoreId] [bigint] NOT NULL,
[OptionType] [int] NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[NameIsHidden] [bit] NOT NULL,
[IsVariant] [bit] NOT NULL,
[IsShared] [bit] NOT NULL,
[Settings] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_ProductOptions] on [dbo].[bvc_ProductOptions]'
GO
ALTER TABLE [dbo].[bvc_ProductOptions] ADD CONSTRAINT [PK_bvc_ProductOptions] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductOptions_StoreID] on [dbo].[bvc_ProductOptions]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductOptions_StoreID] ON [dbo].[bvc_ProductOptions] ([StoreId])
GO
PRINT N'Creating [dbo].[ecommrc_StoreSettings]'
GO
CREATE TABLE [dbo].[ecommrc_StoreSettings]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[SettingName] [varchar] (50) NOT NULL,
[SettingValue] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_StoreSettings] on [dbo].[ecommrc_StoreSettings]'
GO
ALTER TABLE [dbo].[ecommrc_StoreSettings] ADD CONSTRAINT [PK_ecommrc_StoreSettings] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_ecommrc_StoreSettings_StoreId] on [dbo].[ecommrc_StoreSettings]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_StoreSettings_StoreId] ON [dbo].[ecommrc_StoreSettings] ([StoreId])
GO
PRINT N'Creating [dbo].[bvc_SiteTerm]'
GO
CREATE TABLE [dbo].[bvc_SiteTerm]
(
[SiteTerm] [nvarchar] (255) NOT NULL,
[SiteTermValue] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_SiteTerm] on [dbo].[bvc_SiteTerm]'
GO
ALTER TABLE [dbo].[bvc_SiteTerm] ADD CONSTRAINT [PK_bvc_SiteTerm] PRIMARY KEY CLUSTERED  ([SiteTerm])
GO
PRINT N'Creating [dbo].[bvc_Variants]'
GO
CREATE TABLE [dbo].[bvc_Variants]
(
[bvin] [varchar] (36) NOT NULL,
[ProductId] [varchar] (36) NOT NULL,
[Sku] [nvarchar] (255) NOT NULL,
[Price] [decimal] (18, 10) NOT NULL,
[SelectionData] [nvarchar] (max) NOT NULL,
[StoreId] [bigint] NOT NULL
)
GO
PRINT N'Creating index [IX_bvc_Variants_ProductIdClustered] on [dbo].[bvc_Variants]'
GO
CREATE CLUSTERED INDEX [IX_bvc_Variants_ProductIdClustered] ON [dbo].[bvc_Variants] ([ProductId], [StoreId])
GO
PRINT N'Creating primary key [PK_bvc_Variant] on [dbo].[bvc_Variants]'
GO
ALTER TABLE [dbo].[bvc_Variants] ADD CONSTRAINT [PK_bvc_Variant] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_Variants_BvinProductStore] on [dbo].[bvc_Variants]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Variants_BvinProductStore] ON [dbo].[bvc_Variants] ([bvin], [ProductId], [StoreId])
GO
PRINT N'Creating [dbo].[bvc_AuthenticationToken]'
GO
CREATE TABLE [dbo].[bvc_AuthenticationToken]
(
[bvin] [varchar] (36) NOT NULL,
[UserBvin] [varchar] (36) NOT NULL,
[ExpirationDate] [datetime] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_AuthenticationToken_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_AuthenticationToken] on [dbo].[bvc_AuthenticationToken]'
GO
ALTER TABLE [dbo].[bvc_AuthenticationToken] ADD CONSTRAINT [PK_bvc_AuthenticationToken] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvb_BillingAccounts]'
GO
CREATE TABLE [dbo].[bvb_BillingAccounts]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[Email] [nvarchar] (255) NOT NULL,
[CreditCard] [ntext] NOT NULL,
[BillingZipCode] [nvarchar] (50) NOT NULL CONSTRAINT [DF_bvb_BillingAccounts_BillingZipCode] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_bvb_BillingAccount] on [dbo].[bvb_BillingAccounts]'
GO
ALTER TABLE [dbo].[bvb_BillingAccounts] ADD CONSTRAINT [PK_bvb_BillingAccount] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvb_BillingAccounts] on [dbo].[bvb_BillingAccounts]'
GO
CREATE NONCLUSTERED INDEX [IX_bvb_BillingAccounts] ON [dbo].[bvb_BillingAccounts] ([Email])
GO
PRINT N'Creating [dbo].[bvc_PriceGroup]'
GO
CREATE TABLE [dbo].[bvc_PriceGroup]
(
[bvin] [varchar] (36) NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[PricingType] [int] NOT NULL,
[AdjustmentAmount] [numeric] (18, 10) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_PriceGroup_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_PriceGroup] on [dbo].[bvc_PriceGroup]'
GO
ALTER TABLE [dbo].[bvc_PriceGroup] ADD CONSTRAINT [PK_bvc_PriceGroup] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_Vendor]'
GO
CREATE TABLE [dbo].[bvc_Vendor]
(
[bvin] [varchar] (36) NOT NULL,
[DisplayName] [nvarchar] (255) NOT NULL,
[EmailAddress] [nvarchar] (255) NOT NULL,
[Address] [ntext] NOT NULL,
[DropShipEmailTemplateId] [varchar] (36) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Vendor_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Vendor] on [dbo].[bvc_Vendor]'
GO
ALTER TABLE [dbo].[bvc_Vendor] ADD CONSTRAINT [PK_bvc_Vendor] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_Fraud]'
GO
CREATE TABLE [dbo].[bvc_Fraud]
(
[bvin] [varchar] (36) NOT NULL,
[RuleType] [int] NOT NULL,
[RuleValue] [nvarchar] (255) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Fraud_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Fraud] on [dbo].[bvc_Fraud]'
GO
ALTER TABLE [dbo].[bvc_Fraud] ADD CONSTRAINT [PK_bvc_Fraud] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[ecommrc_StoresXUsers]'
GO
CREATE TABLE [dbo].[ecommrc_StoresXUsers]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[UserId] [bigint] NOT NULL,
[AccessMode] [int] NOT NULL CONSTRAINT [DF_ecommrc_StoresXUsers_AccessMode] DEFAULT ((1))
)
GO
PRINT N'Creating primary key [PK_ecommrc_StoresXUsers] on [dbo].[ecommrc_StoresXUsers]'
GO
ALTER TABLE [dbo].[ecommrc_StoresXUsers] ADD CONSTRAINT [PK_ecommrc_StoresXUsers] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_ecommrc_StoresXUsers_StoreId] on [dbo].[ecommrc_StoresXUsers]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_StoresXUsers_StoreId] ON [dbo].[ecommrc_StoresXUsers] ([StoreId])
GO
PRINT N'Creating index [IX_ecommrc_StoresXUsers_UserId] on [dbo].[ecommrc_StoresXUsers]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_StoresXUsers_UserId] ON [dbo].[ecommrc_StoresXUsers] ([UserId])
GO
PRINT N'Creating [dbo].[bvc_GiftCard]'
GO
CREATE TABLE [dbo].[bvc_GiftCard]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[CardNumber] [nvarchar] (50) NOT NULL,
[Amount] [decimal] (18, 10) NOT NULL,
[IssueDateUtc] [datetime] NOT NULL,
[ExpirationDateUtc] [datetime] NOT NULL,
[PurchaserEmail] [nvarchar] (255) NOT NULL,
[RecipientEmail] [nvarchar] (255) NOT NULL,
[GiftMessage] [nvarchar] (max) NOT NULL,
[IsRedeemed] [bit] NOT NULL CONSTRAINT [DF_bvc_GiftCard_IsRedeemed] DEFAULT ((0)),
[RedemptionDateUtc] [datetime] NOT NULL,
[RedemptionUserId] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_GiftCard] on [dbo].[bvc_GiftCard]'
GO
ALTER TABLE [dbo].[bvc_GiftCard] ADD CONSTRAINT [PK_bvc_GiftCard] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_CategoryXProperty]'
GO
CREATE TABLE [dbo].[bvc_CategoryXProperty]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[CategoryId] [nvarchar] (36) NOT NULL,
[PropertyId] [bigint] NOT NULL,
[ParentPropertyId] [bigint] NOT NULL,
[SortOrder] [int] NOT NULL,
[FilterName] [nvarchar] (255) NOT NULL,
[DisplayMode] [int] NOT NULL CONSTRAINT [DF_bvc_CategoryXProperty_AllowMultiple] DEFAULT ((0)),
[StoreId] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_CategoryXProperty] on [dbo].[bvc_CategoryXProperty]'
GO
ALTER TABLE [dbo].[bvc_CategoryXProperty] ADD CONSTRAINT [PK_bvc_CategoryXProperty] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_RMAItem]'
GO
CREATE TABLE [dbo].[bvc_RMAItem]
(
[bvin] [varchar] (36) NOT NULL,
[RMABvin] [varchar] (36) NOT NULL,
[LineItemBvin] [varchar] (36) NOT NULL,
[ItemName] [nvarchar] (512) NOT NULL,
[ItemDescription] [nvarchar] (max) NOT NULL,
[Note] [nvarchar] (max) NOT NULL,
[Reason] [nvarchar] (max) NOT NULL,
[Replace] [bit] NOT NULL,
[Quantity] [int] NOT NULL,
[QuantityReceived] [int] NOT NULL,
[QuantityReturnedToInventory] [int] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_RMAItem_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating index [IX_bvc_RMAItem] on [dbo].[bvc_RMAItem]'
GO
CREATE UNIQUE CLUSTERED INDEX [IX_bvc_RMAItem] ON [dbo].[bvc_RMAItem] ([bvin])
GO
PRINT N'Creating primary key [PK_bvc_RMAItem] on [dbo].[bvc_RMAItem]'
GO
ALTER TABLE [dbo].[bvc_RMAItem] ADD CONSTRAINT [PK_bvc_RMAItem] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_RMAItem_1] on [dbo].[bvc_RMAItem]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_RMAItem_1] ON [dbo].[bvc_RMAItem] ([RMABvin])
GO
PRINT N'Creating index [IX_bvc_RMAItem_LineItemBvin] on [dbo].[bvc_RMAItem]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_RMAItem_LineItemBvin] ON [dbo].[bvc_RMAItem] ([LineItemBvin]) WITH (ALLOW_PAGE_LOCKS=OFF)
GO
PRINT N'Creating [dbo].[bvc_HtmlTemplates]'
GO
CREATE TABLE [dbo].[bvc_HtmlTemplates]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[LastUpdatedUtc] [datetime] NOT NULL,
[DisplayName] [nvarchar] (255) NOT NULL,
[FromEmail] [nvarchar] (255) NOT NULL,
[Subject] [nvarchar] (1024) NOT NULL,
[Body] [nvarchar] (max) NOT NULL,
[RepeatingSection] [nvarchar] (max) NOT NULL,
[TemplateType] [int] NOT NULL CONSTRAINT [DF_bvc_HtmlTemplates_TemplateType] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_HtmlTemplates] on [dbo].[bvc_HtmlTemplates]'
GO
ALTER TABLE [dbo].[bvc_HtmlTemplates] ADD CONSTRAINT [PK_bvc_HtmlTemplates] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_HtmlTemplates_StoreId] on [dbo].[bvc_HtmlTemplates]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_HtmlTemplates_StoreId] ON [dbo].[bvc_HtmlTemplates] ([StoreId])
GO
PRINT N'Creating [dbo].[ecommrc_ShippingZones]'
GO
CREATE TABLE [dbo].[ecommrc_ShippingZones]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[Name] [nvarchar] (50) NOT NULL,
[Areas] [ntext] NOT NULL CONSTRAINT [DF_ecommrc_ShippingZones_Areas] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_ecommrc_ShippingZones] on [dbo].[ecommrc_ShippingZones]'
GO
ALTER TABLE [dbo].[ecommrc_ShippingZones] ADD CONSTRAINT [PK_ecommrc_ShippingZones] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bv_SearchLexicon]'
GO
CREATE TABLE [dbo].[bv_SearchLexicon]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[Word] [nvarchar] (255) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bv_SearchLexicon] on [dbo].[bv_SearchLexicon]'
GO
ALTER TABLE [dbo].[bv_SearchLexicon] ADD CONSTRAINT [PK_bv_SearchLexicon] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bv_SearchLexicon_Word] on [dbo].[bv_SearchLexicon]'
GO
CREATE NONCLUSTERED INDEX [IX_bv_SearchLexicon_Word] ON [dbo].[bv_SearchLexicon] ([Word])
GO
PRINT N'Creating [dbo].[ConversationGroups]'
GO
CREATE TABLE [dbo].[ConversationGroups]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[Title] [nvarchar] (255) NOT NULL,
[Slug] [nvarchar] (255) NOT NULL,
[SortOrder] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ConversationGroups] on [dbo].[ConversationGroups]'
GO
ALTER TABLE [dbo].[ConversationGroups] ADD CONSTRAINT [PK_ConversationGroups] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[Conversations]'
GO
CREATE TABLE [dbo].[Conversations]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[GroupId] [bigint] NOT NULL,
[Topic] [nvarchar] (255) NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[DateCreatedUtc] [datetime] NOT NULL,
[AuthorId] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Conversations] on [dbo].[Conversations]'
GO
ALTER TABLE [dbo].[Conversations] ADD CONSTRAINT [PK_Conversations] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_AuthTokens]'
GO
CREATE TABLE [dbo].[ecommrc_AuthTokens]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[TokenId] [uniqueidentifier] NOT NULL,
[UserId] [bigint] NOT NULL,
[Expires] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_AuthTokens] on [dbo].[ecommrc_AuthTokens]'
GO
ALTER TABLE [dbo].[ecommrc_AuthTokens] ADD CONSTRAINT [PK_ecommrc_AuthTokens] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_Taxes]'
GO
CREATE TABLE [dbo].[ecommrc_Taxes]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[CountryName] [nvarchar] (255) NOT NULL,
[RegionName] [nvarchar] (255) NOT NULL,
[PostalCode] [nvarchar] (20) NOT NULL,
[TaxScheduleId] [bigint] NOT NULL,
[Rate] [numeric] (18, 10) NOT NULL,
[ApplyToShipping] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_Taxes] on [dbo].[ecommrc_Taxes]'
GO
ALTER TABLE [dbo].[ecommrc_Taxes] ADD CONSTRAINT [PK_ecommrc_Taxes] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_TaxSchedules]'
GO
CREATE TABLE [dbo].[ecommrc_TaxSchedules]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_TaxSchedules] on [dbo].[ecommrc_TaxSchedules]'
GO
ALTER TABLE [dbo].[ecommrc_TaxSchedules] ADD CONSTRAINT [PK_ecommrc_TaxSchedules] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_Order]'
GO
CREATE TABLE [dbo].[bvc_Order]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[bvin] [varchar] (36) NOT NULL,
[AffiliateId] [varchar] (36) NOT NULL,
[BillingAddress] [ntext] NOT NULL,
[CustomProperties] [ntext] NOT NULL CONSTRAINT [DF_bvc_Order_CustomProperties] DEFAULT (N''),
[FraudScore] [decimal] (18, 2) NOT NULL CONSTRAINT [DF_bvc_Order_FraudScore] DEFAULT ((-1)),
[GrandTotal] [decimal] (18, 10) NOT NULL,
[HandlingTotal] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_HandlingTotal] DEFAULT ((0)),
[Instructions] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Order_Instructions] DEFAULT (N''),
[IsPlaced] [int] NOT NULL CONSTRAINT [DF_bvc_Order_IsPlaced] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[OrderDiscounts] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_OrderDiscounts] DEFAULT ((0)),
[OrderDiscountDetails] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Order_OrderDiscountDetails] DEFAULT (''),
[OrderNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_bvc_Order_OrderNumber] DEFAULT (N''),
[PaymentStatus] [int] NOT NULL,
[ShippingAddress] [ntext] NOT NULL CONSTRAINT [DF_bvc_Order_ShippingAddress] DEFAULT (N''),
[ShippingMethodId] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingMethodId] DEFAULT (''),
[ShippingMethodDisplayName] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingMethodDisplayName] DEFAULT (N''),
[ShippingProviderId] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingProviderId] DEFAULT (''),
[ShippingProviderServiceCode] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingProviderServiceCode] DEFAULT (N''),
[ShippingStatus] [int] NOT NULL,
[ShippingTotal] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingTotal] DEFAULT ((0)),
[ShippingDiscounts] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingDiscounts] DEFAULT ((0)),
[ShippingDiscountDetails] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Order_ShippingDiscountDetails] DEFAULT (''),
[SubTotal] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_SubTotal] DEFAULT ((0)),
[TaxTotal] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_TaxTotal] DEFAULT ((0)),
[TaxTotal2] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Order_TaxTotal2] DEFAULT ((0)),
[TimeOfOrder] [datetime] NOT NULL,
[UserEmail] [nvarchar] (100) NOT NULL CONSTRAINT [DF_bvc_Order_UserEmail] DEFAULT (N''),
[UserId] [varchar] (36) NOT NULL,
[StatusCode] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_Order_StatusCode] DEFAULT (''),
[StatusName] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Order_StatusName] DEFAULT (N''),
[ThirdPartyOrderId] [nvarchar] (50) NOT NULL CONSTRAINT [DF_bvc_Order_ThirdPartyOrderId] DEFAULT (''),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Order_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Order] on [dbo].[bvc_Order]'
GO
ALTER TABLE [dbo].[bvc_Order] ADD CONSTRAINT [PK_bvc_Order] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_Order_OrderNumber] on [dbo].[bvc_Order]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Order_OrderNumber] ON [dbo].[bvc_Order] ([OrderNumber])
GO
PRINT N'Creating index [IX_bvc_Order_TimeOfOrder] on [dbo].[bvc_Order]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Order_TimeOfOrder] ON [dbo].[bvc_Order] ([TimeOfOrder])
GO
PRINT N'Creating index [IX_bvc_Order_UserId] on [dbo].[bvc_Order]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Order_UserId] ON [dbo].[bvc_Order] ([UserId])
GO
PRINT N'Creating index [IX_bvc_Order_StoreId] on [dbo].[bvc_Order]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Order_StoreId] ON [dbo].[bvc_Order] ([StoreId])
GO
PRINT N'Creating [dbo].[bvc_SearchQuery]'
GO
CREATE TABLE [dbo].[bvc_SearchQuery]
(
[bvin] [varchar] (36) NOT NULL,
[QueryPhrase] [nvarchar] (max) NOT NULL,
[ShopperId] [varchar] (36) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_SearchQuery_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_SearchQuery] on [dbo].[bvc_SearchQuery]'
GO
ALTER TABLE [dbo].[bvc_SearchQuery] ADD CONSTRAINT [PK_bvc_SearchQuery] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ComponentSetting]'
GO
CREATE TABLE [dbo].[bvc_ComponentSetting]
(
[ComponentID] [varchar] (36) NOT NULL,
[SettingName] [nvarchar] (100) NOT NULL,
[SettingValue] [text] NOT NULL,
[DeveloperId] [nvarchar] (15) NOT NULL,
[ComponentType] [nvarchar] (25) NOT NULL,
[ComponentSubType] [nvarchar] (25) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ComponentSetting_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ComponentSetting] on [dbo].[bvc_ComponentSetting]'
GO
ALTER TABLE [dbo].[bvc_ComponentSetting] ADD CONSTRAINT [PK_bvc_ComponentSetting] PRIMARY KEY CLUSTERED  ([ComponentID], [SettingName])
GO
PRINT N'Creating index [IX_bvc_ComponentSetting] on [dbo].[bvc_ComponentSetting]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ComponentSetting] ON [dbo].[bvc_ComponentSetting] ([ComponentID])
GO
PRINT N'Creating [dbo].[bvc_ProductInventory]'
GO
CREATE TABLE [dbo].[bvc_ProductInventory]
(
[bvin] [varchar] (36) NOT NULL,
[ProductBvin] [varchar] (36) NOT NULL,
[VariantId] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_ProductInventory_VariantId] DEFAULT (''),
[QuantityOnHand] [int] NOT NULL CONSTRAINT [DF_bvc_ProductInventory_QuantityOnHand] DEFAULT ((0)),
[QuantityReserved] [int] NOT NULL CONSTRAINT [DF_bvc_ProductInventory_QuantityReserved] DEFAULT ((0)),
[QuantityAvailableForSale] AS ([QuantityOnHand]-[QuantityReserved]) PERSISTED,
[LowStockPoint] [int] NOT NULL CONSTRAINT [DF_bvc_ProductInventory_LowStockPoint] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductInventory_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductInventory] on [dbo].[bvc_ProductInventory]'
GO
ALTER TABLE [dbo].[bvc_ProductInventory] ADD CONSTRAINT [PK_bvc_ProductInventory] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductInventory] on [dbo].[bvc_ProductInventory]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductInventory] ON [dbo].[bvc_ProductInventory] ([ProductBvin])
GO
PRINT N'Creating [dbo].[bvc_ProductXCategory]'
GO
CREATE TABLE [dbo].[bvc_ProductXCategory]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ProductId] [varchar] (36) NOT NULL,
[CategoryId] [varchar] (36) NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_bvc_ProductXCategory_SortOrder] DEFAULT ((0)),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductXCategory_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductXCategory] on [dbo].[bvc_ProductXCategory]'
GO
ALTER TABLE [dbo].[bvc_ProductXCategory] ADD CONSTRAINT [PK_bvc_ProductXCategory] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_ProductXCategory] on [dbo].[bvc_ProductXCategory]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductXCategory] ON [dbo].[bvc_ProductXCategory] ([ProductId], [CategoryId])
GO
PRINT N'Creating index [IX_bvc_ProductXCategory] on [dbo].[bvc_ProductXCategory]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductXCategory] ON [dbo].[bvc_ProductXCategory] ([CategoryId])
GO
PRINT N'Creating [dbo].[bvc_ProductPropertyValue]'
GO
CREATE TABLE [dbo].[bvc_ProductPropertyValue]
(
[ProductBvin] [varchar] (36) NOT NULL,
[PropertyId] [bigint] NOT NULL,
[PropertyChoiceId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductPropertyValue_PropertyChoiceId] DEFAULT ((-1)),
[PropertyValue] [nvarchar] (max) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductPropertyValue_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductPropertyValue] on [dbo].[bvc_ProductPropertyValue]'
GO
ALTER TABLE [dbo].[bvc_ProductPropertyValue] ADD CONSTRAINT [PK_bvc_ProductPropertyValue] PRIMARY KEY CLUSTERED  ([ProductBvin], [PropertyId])
GO
PRINT N'Creating index [IX_bvc_ProductPropertyValue] on [dbo].[bvc_ProductPropertyValue]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductPropertyValue] ON [dbo].[bvc_ProductPropertyValue] ([PropertyChoiceId])
GO
PRINT N'Creating [dbo].[bvc_ProductFile]'
GO
CREATE TABLE [dbo].[bvc_ProductFile]
(
[bvin] [varchar] (36) NOT NULL,
[FileName] [nvarchar] (100) NOT NULL,
[ShortDescription] [nvarchar] (100) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductFile_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductFile] on [dbo].[bvc_ProductFile]'
GO
ALTER TABLE [dbo].[bvc_ProductFile] ADD CONSTRAINT [PK_bvc_ProductFile] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductFile] on [dbo].[bvc_ProductFile]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_bvc_ProductFile] ON [dbo].[bvc_ProductFile] ([FileName], [ShortDescription])
GO
PRINT N'Creating [dbo].[bvc_Product]'
GO
CREATE TABLE [dbo].[bvc_Product]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[bvin] [varchar] (36) NOT NULL,
[SKU] [nvarchar] (50) NOT NULL,
[ProductName] [nvarchar] (255) NOT NULL,
[ProductTypeId] [varchar] (36) NOT NULL,
[ListPrice] [numeric] (18, 10) NOT NULL,
[SitePrice] [numeric] (18, 10) NOT NULL,
[SiteCost] [numeric] (18, 10) NOT NULL,
[MetaKeywords] [nvarchar] (255) NOT NULL,
[MetaDescription] [nvarchar] (255) NOT NULL,
[MetaTitle] [nvarchar] (512) NOT NULL,
[TaxExempt] [int] NOT NULL,
[TaxClass] [varchar] (36) NOT NULL,
[NonShipping] [int] NOT NULL,
[ShipSeparately] [int] NOT NULL,
[ShippingMode] [int] NOT NULL,
[ShippingWeight] [numeric] (18, 10) NOT NULL,
[ShippingLength] [numeric] (18, 10) NOT NULL,
[ShippingWidth] [numeric] (18, 10) NOT NULL,
[ShippingHeight] [numeric] (18, 10) NOT NULL,
[Status] [int] NOT NULL,
[ImageFileSmall] [nvarchar] (512) NOT NULL,
[ImageFileMedium] [nvarchar] (512) NOT NULL,
[CreationDate] [datetime] NOT NULL,
[MinimumQty] [int] NOT NULL,
[ShortDescription] [nvarchar] (512) NOT NULL,
[LongDescription] [nvarchar] (max) NOT NULL,
[ManufacturerID] [varchar] (36) NOT NULL,
[VendorID] [varchar] (36) NOT NULL,
[GiftWrapAllowed] [int] NOT NULL,
[ExtraShipFee] [numeric] (18, 10) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[Keywords] [nvarchar] (max) NOT NULL,
[TemplateName] [nvarchar] (512) NOT NULL,
[PreContentColumnId] [varchar] (36) NOT NULL,
[PostContentColumnId] [varchar] (36) NOT NULL,
[RewriteUrl] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Product_RewriteUrl] DEFAULT (N''),
[SitePriceOverrideText] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Product_SitePriceOverrideText] DEFAULT (N''),
[PreTransformLongDescription] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Product_PreTransformLongDescription] DEFAULT (N''),
[SmallImageAlternateText] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Product_SmallImageAlternateText] DEFAULT (''),
[MediumImageAlternateText] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Product_MediumImageAlternateText] DEFAULT (''),
[CustomProperties] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Product_CustomProperties] DEFAULT (''),
[GiftWrapPrice] [numeric] (18, 10) NOT NULL CONSTRAINT [DF_bvc_Product_GiftWrapPrice] DEFAULT ((0.00)),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Product_StoreId] DEFAULT ((0)),
[Featured] [bit] NOT NULL CONSTRAINT [DF_bvc_Product_Featured] DEFAULT ((0)),
[AllowReviews] [bit] NOT NULL CONSTRAINT [DF_bvc_Product_AllowReviews] DEFAULT ((1)),
[DescriptionTabs] [ntext] NOT NULL CONSTRAINT [DF_bvc_Product_DescriptionTabs] DEFAULT (''),
[OutOfStockMode] [int] NOT NULL CONSTRAINT [DF_bvc_Product_OutOfStockMode] DEFAULT ((0)),
[IsAvailableForSale] [bit] NOT NULL CONSTRAINT [DF_bvc_Product_IsInStock] DEFAULT ((1))
)
GO
PRINT N'Creating primary key [PK_bvc_Product] on [dbo].[bvc_Product]'
GO
ALTER TABLE [dbo].[bvc_Product] ADD CONSTRAINT [PK_bvc_Product] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_Product_Status] on [dbo].[bvc_Product]'
GO
CREATE NONCLUSTERED INDEX [IX_Product_Status] ON [dbo].[bvc_Product] ([Status], [bvin]) WITH (ALLOW_PAGE_LOCKS=OFF)
GO
PRINT N'Creating index [IX_bvc_Product] on [dbo].[bvc_Product]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Product] ON [dbo].[bvc_Product] ([SKU])
GO
PRINT N'Creating index [IX_Product_ProductName] on [dbo].[bvc_Product]'
GO
CREATE NONCLUSTERED INDEX [IX_Product_ProductName] ON [dbo].[bvc_Product] ([ProductName]) WITH (ALLOW_PAGE_LOCKS=OFF)
GO
PRINT N'Creating index [IX_Product_ManufacturerId] on [dbo].[bvc_Product]'
GO
CREATE NONCLUSTERED INDEX [IX_Product_ManufacturerId] ON [dbo].[bvc_Product] ([ManufacturerID]) WITH (ALLOW_PAGE_LOCKS=OFF)
GO
PRINT N'Creating index [IX_Product_VendorId] on [dbo].[bvc_Product]'
GO
CREATE NONCLUSTERED INDEX [IX_Product_VendorId] ON [dbo].[bvc_Product] ([VendorID]) WITH (ALLOW_PAGE_LOCKS=OFF)
GO
PRINT N'Creating [dbo].[bvc_User]'
GO
CREATE TABLE [dbo].[bvc_User]
(
[bvin] [varchar] (36) NOT NULL,
[Email] [nvarchar] (100) NOT NULL,
[FirstName] [nvarchar] (50) NOT NULL,
[LastName] [nvarchar] (100) NOT NULL,
[Password] [nvarchar] (50) NOT NULL,
[Salt] [nvarchar] (50) NOT NULL,
[TaxExempt] [int] NOT NULL,
[CreationDate] [datetime] NOT NULL,
[LastLoginDate] [datetime] NOT NULL,
[Comment] [ntext] NOT NULL,
[AddressBook] [ntext] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[Locked] [int] NOT NULL CONSTRAINT [DF_bvc_User_Locked] DEFAULT ((0)),
[LockedUntil] [datetime] NOT NULL,
[FailedLoginCount] [int] NOT NULL CONSTRAINT [DF_bvc_User_FailedLoginCount] DEFAULT ((0)),
[Phones] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_User_BillingAddress] DEFAULT (N''),
[PricingGroup] [varchar] (36) NOT NULL,
[CustomQuestionAnswers] [nvarchar] (max) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_User_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_User] on [dbo].[bvc_User]'
GO
ALTER TABLE [dbo].[bvc_User] ADD CONSTRAINT [PK_bvc_User] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ProductReview]'
GO
CREATE TABLE [dbo].[bvc_ProductReview]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[lastUpdated] [datetime] NOT NULL,
[bvin] [varchar] (36) NOT NULL,
[Approved] [int] NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[Karma] [int] NOT NULL,
[ReviewDate] [datetime] NOT NULL,
[Rating] [int] NOT NULL,
[UserID] [varchar] (36) NOT NULL,
[ProductBvin] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductReview_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating index [IX_bvc_ProductReview_ProductBvin] on [dbo].[bvc_ProductReview]'
GO
CREATE CLUSTERED INDEX [IX_bvc_ProductReview_ProductBvin] ON [dbo].[bvc_ProductReview] ([ProductBvin])
GO
PRINT N'Creating index [IX_bvc_ProductReview] on [dbo].[bvc_ProductReview]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_bvc_ProductReview] ON [dbo].[bvc_ProductReview] ([Id])
GO
PRINT N'Creating primary key [PK_bvc_ProductReview] on [dbo].[bvc_ProductReview]'
GO
ALTER TABLE [dbo].[bvc_ProductReview] ADD CONSTRAINT [PK_bvc_ProductReview] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ContactUsQuestions]'
GO
CREATE TABLE [dbo].[bvc_ContactUsQuestions]
(
[bvin] [varchar] (36) NOT NULL,
[QuestionName] [nvarchar] (50) NOT NULL,
[QuestionType] [int] NOT NULL,
[Values] [nvarchar] (max) NOT NULL,
[Order] [int] NOT NULL CONSTRAINT [DF_bvc_ContactUsQuestions_Order] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ContactUsQuestions_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ContactUsQuestions] on [dbo].[bvc_ContactUsQuestions]'
GO
ALTER TABLE [dbo].[bvc_ContactUsQuestions] ADD CONSTRAINT [PK_bvc_ContactUsQuestions] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_CustomUrl]'
GO
CREATE TABLE [dbo].[bvc_CustomUrl]
(
[bvin] [varchar] (36) NOT NULL,
[RequestedUrl] [nvarchar] (max) NOT NULL,
[RedirectToUrl] [nvarchar] (max) NOT NULL,
[IsPermanentRedirect] [bit] NOT NULL CONSTRAINT [DF_bvc_CustomUrl_SystemUrl] DEFAULT ((1)),
[SystemDataType] [int] NOT NULL CONSTRAINT [DF_bvc_CustomUrl_SystemDataType] DEFAULT ((0)),
[SystemData] [nvarchar] (50) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_CustomUrl_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_CustomUrl] on [dbo].[bvc_CustomUrl]'
GO
ALTER TABLE [dbo].[bvc_CustomUrl] ADD CONSTRAINT [PK_bvc_CustomUrl] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_CustomUrl] on [dbo].[bvc_CustomUrl]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_CustomUrl] ON [dbo].[bvc_CustomUrl] ([SystemData])
GO
PRINT N'Creating [dbo].[bvc_Audit]'
GO
CREATE TABLE [dbo].[bvc_Audit]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[TimeStampUtc] [datetime] NOT NULL,
[SourceModule] [int] NOT NULL,
[ShortName] [nvarchar] (255) NOT NULL,
[Description] [nvarchar] (max) NOT NULL,
[UserId] [nvarchar] (50) NOT NULL CONSTRAINT [DF_bvc_Audit_UserId] DEFAULT (''),
[UserIdText] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Audit_UserIdTest] DEFAULT (''),
[Severity] [int] NOT NULL CONSTRAINT [DF_bvc_Audit_Severity] DEFAULT ((0)),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Audit_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Audit] on [dbo].[bvc_Audit]'
GO
ALTER TABLE [dbo].[bvc_Audit] ADD CONSTRAINT [PK_bvc_Audit] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_WishList]'
GO
CREATE TABLE [dbo].[bvc_WishList]
(
[bvin] [varchar] (36) NOT NULL,
[UserId] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_WishList_UserId] DEFAULT (''),
[ProductBvin] [varchar] (36) NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF_bvc_WishList_Quantity] DEFAULT ((1)),
[Modifiers] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_WishList_Modifiers] DEFAULT (''),
[Inputs] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_WishList_Inputs] DEFAULT (''),
[StoreId] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_WishList_1] on [dbo].[bvc_WishList]'
GO
ALTER TABLE [dbo].[bvc_WishList] ADD CONSTRAINT [PK_bvc_WishList_1] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ProductFileXProduct]'
GO
CREATE TABLE [dbo].[bvc_ProductFileXProduct]
(
[ProductFileId] [varchar] (36) NOT NULL,
[ProductId] [varchar] (36) NOT NULL,
[AvailableMinutes] [int] NOT NULL,
[MaxDownloads] [int] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductFileXProduct_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductFileXProduct] on [dbo].[bvc_ProductFileXProduct]'
GO
ALTER TABLE [dbo].[bvc_ProductFileXProduct] ADD CONSTRAINT [PK_bvc_ProductFileXProduct] PRIMARY KEY CLUSTERED  ([ProductFileId], [ProductId])
GO
PRINT N'Creating index [IX_bvc_ProductFileXProduct] on [dbo].[bvc_ProductFileXProduct]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductFileXProduct] ON [dbo].[bvc_ProductFileXProduct] ([ProductFileId])
GO
PRINT N'Creating [dbo].[bvc_ContentBlock]'
GO
CREATE TABLE [dbo].[bvc_ContentBlock]
(
[bvin] [varchar] (36) NOT NULL,
[ColumnID] [varchar] (36) NOT NULL,
[SortOrder] [int] NOT NULL,
[ControlName] [nvarchar] (512) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ContentBlock_StoreId] DEFAULT ((0)),
[SerializedSettings] [ntext] NOT NULL CONSTRAINT [DF_bvc_ContentBlock_SerializedSettings] DEFAULT (''),
[SerializedLists] [ntext] NOT NULL CONSTRAINT [DF_bvc_ContentBlock_SerializedLists] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_bvc_ContentBlock] on [dbo].[bvc_ContentBlock]'
GO
ALTER TABLE [dbo].[bvc_ContentBlock] ADD CONSTRAINT [PK_bvc_ContentBlock] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ComponentSettingList]'
GO
CREATE TABLE [dbo].[bvc_ComponentSettingList]
(
[bvin] [varchar] (36) NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_bvc_ComponentSettingList_SortOrder] DEFAULT ((0)),
[ComponentID] [nvarchar] (50) NOT NULL,
[DeveloperId] [nvarchar] (15) NOT NULL,
[ComponentType] [nvarchar] (25) NOT NULL,
[ComponentSubType] [nvarchar] (25) NOT NULL,
[ListName] [nvarchar] (255) NOT NULL,
[Setting1] [nvarchar] (max) NOT NULL,
[Setting2] [nvarchar] (max) NOT NULL,
[Setting3] [nvarchar] (max) NOT NULL,
[Setting4] [nvarchar] (max) NOT NULL,
[Setting5] [nvarchar] (max) NOT NULL,
[Setting6] [nvarchar] (max) NOT NULL,
[Setting7] [nvarchar] (max) NOT NULL,
[Setting8] [nvarchar] (max) NOT NULL,
[Setting9] [nvarchar] (max) NOT NULL,
[Setting10] [nvarchar] (max) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ComponentSettingList_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ComponentSettingList] on [dbo].[bvc_ComponentSettingList]'
GO
ALTER TABLE [dbo].[bvc_ComponentSettingList] ADD CONSTRAINT [PK_bvc_ComponentSettingList] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ComponentSettingList] on [dbo].[bvc_ComponentSettingList]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ComponentSettingList] ON [dbo].[bvc_ComponentSettingList] ([ComponentID])
GO
PRINT N'Creating index [IX_bvc_ComponentSettingList_1] on [dbo].[bvc_ComponentSettingList]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ComponentSettingList_1] ON [dbo].[bvc_ComponentSettingList] ([ListName])
GO
PRINT N'Creating [dbo].[bvc_ProductTypeXProductProperty]'
GO
CREATE TABLE [dbo].[bvc_ProductTypeXProductProperty]
(
[ProductTypeBvin] [varchar] (36) NOT NULL,
[PropertyId] [bigint] NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_ProductTypeProperties_SortOrder] DEFAULT ((1)),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductTypeXProductProperty_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductTypeXProductProperty] on [dbo].[bvc_ProductTypeXProductProperty]'
GO
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] ADD CONSTRAINT [PK_bvc_ProductTypeXProductProperty] PRIMARY KEY CLUSTERED  ([ProductTypeBvin], [PropertyId])
GO
PRINT N'Creating [dbo].[bvc_ProductProperty]'
GO
CREATE TABLE [dbo].[bvc_ProductProperty]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[PropertyName] [nvarchar] (512) NOT NULL,
[DisplayName] [nvarchar] (512) NOT NULL,
[DisplayOnSite] [int] NOT NULL CONSTRAINT [DF_ProductProperty_DisplayOnSite] DEFAULT ((1)),
[DisplayToDropShipper] [int] NOT NULL CONSTRAINT [DF_ProductProperty_IsRequired] DEFAULT ((0)),
[TypeCode] [int] NOT NULL CONSTRAINT [DF_ProductProperty_TypeCode] DEFAULT ((0)),
[DefaultValue] [ntext] NOT NULL,
[CultureCode] [varchar] (10) NOT NULL CONSTRAINT [DF_ProductProperty_CultureCode] DEFAULT ('en-US'),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductProperty_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductProperty] on [dbo].[bvc_ProductProperty]'
GO
ALTER TABLE [dbo].[bvc_ProductProperty] ADD CONSTRAINT [PK_bvc_ProductProperty] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_UserXContact]'
GO
CREATE TABLE [dbo].[bvc_UserXContact]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ContactId] [varchar] (36) NOT NULL,
[UserId] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_UserXContact_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_UserXAffiliate] on [dbo].[bvc_UserXContact]'
GO
ALTER TABLE [dbo].[bvc_UserXContact] ADD CONSTRAINT [PK_bvc_UserXAffiliate] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_UserXContact_ContactId] on [dbo].[bvc_UserXContact]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_UserXContact_ContactId] ON [dbo].[bvc_UserXContact] ([ContactId])
GO
PRINT N'Creating index [IX_bvc_UserXContact_UserId] on [dbo].[bvc_UserXContact]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_UserXContact_UserId] ON [dbo].[bvc_UserXContact] ([UserId])
GO
PRINT N'Creating index [IX_bvc_UserXContact_StoreId] on [dbo].[bvc_UserXContact]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_UserXContact_StoreId] ON [dbo].[bvc_UserXContact] ([StoreId])
GO
PRINT N'Creating [dbo].[bvc_Affiliate]'
GO
CREATE TABLE [dbo].[bvc_Affiliate]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ReferralID] [nvarchar] (50) NOT NULL,
[Enabled] [bit] NOT NULL,
[DisplayName] [nvarchar] (255) NOT NULL,
[CommissionAmount] [numeric] (18, 10) NOT NULL,
[CommissionType] [int] NOT NULL,
[ReferralDays] [int] NOT NULL,
[TaxID] [nvarchar] (100) NOT NULL,
[DriversLicenseNumber] [nvarchar] (100) NOT NULL,
[WebSiteURL] [nvarchar] (1000) NOT NULL,
[StyleSheet] [nvarchar] (1000) NOT NULL,
[Notes] [nvarchar] (max) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[Address] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Affiliate_AddressId] DEFAULT (N''),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Affiliate_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Affiliate] on [dbo].[bvc_Affiliate]'
GO
ALTER TABLE [dbo].[bvc_Affiliate] ADD CONSTRAINT [PK_bvc_Affiliate] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_Affiliate] on [dbo].[bvc_Affiliate]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_bvc_Affiliate] ON [dbo].[bvc_Affiliate] ([ReferralID])
GO
PRINT N'Creating [dbo].[bvc_ProductType]'
GO
CREATE TABLE [dbo].[bvc_ProductType]
(
[bvin] [varchar] (36) NOT NULL,
[ProductTypeName] [nvarchar] (512) NOT NULL,
[IsPermanent] [bit] NOT NULL CONSTRAINT [DF_bvc_ProductType_IsPermanent] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductType_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_ProductType] on [dbo].[bvc_ProductType]'
GO
ALTER TABLE [dbo].[bvc_ProductType] ADD CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ContentColumn]'
GO
CREATE TABLE [dbo].[bvc_ContentColumn]
(
[bvin] [varchar] (36) NOT NULL,
[DisplayName] [nvarchar] (512) NOT NULL,
[SystemColumn] [int] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ContentColumn_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ContentColumn] on [dbo].[bvc_ContentColumn]'
GO
ALTER TABLE [dbo].[bvc_ContentColumn] ADD CONSTRAINT [PK_bvc_ContentColumn] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ProductImage]'
GO
CREATE TABLE [dbo].[bvc_ProductImage]
(
[bvin] [varchar] (36) NOT NULL,
[ProductID] [varchar] (36) NOT NULL,
[FileName] [nvarchar] (max) NOT NULL,
[Caption] [nvarchar] (max) NOT NULL,
[AlternateText] [nvarchar] (max) NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_bvc_ProductImage_SortOrder] DEFAULT ((-1)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductImage_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductImage] on [dbo].[bvc_ProductImage]'
GO
ALTER TABLE [dbo].[bvc_ProductImage] ADD CONSTRAINT [PK_bvc_ProductImage] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductImage] on [dbo].[bvc_ProductImage]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductImage] ON [dbo].[bvc_ProductImage] ([ProductID])
GO
PRINT N'Creating [dbo].[bvc_Policy]'
GO
CREATE TABLE [dbo].[bvc_Policy]
(
[bvin] [varchar] (36) NOT NULL,
[Title] [nvarchar] (max) NOT NULL,
[SystemPolicy] [int] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Policy_StoreId] DEFAULT ((0)),
[PolicyType] [int] NOT NULL CONSTRAINT [DF_bvc_Policy_PolicyType] DEFAULT ((100))
)
GO
PRINT N'Creating primary key [PK_bvc_Policy] on [dbo].[bvc_Policy]'
GO
ALTER TABLE [dbo].[bvc_Policy] ADD CONSTRAINT [PK_bvc_Policy] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_Category]'
GO
CREATE TABLE [dbo].[bvc_Category]
(
[bvin] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Category_StoreId] DEFAULT ((0)),
[Name] [nvarchar] (255) NOT NULL,
[Description] [ntext] NOT NULL,
[ParentID] [nvarchar] (50) NOT NULL,
[SortOrder] [int] NOT NULL,
[MetaTitle] [nvarchar] (512) NOT NULL,
[MetaKeywords] [nvarchar] (255) NOT NULL,
[MetaDescription] [nvarchar] (255) NOT NULL,
[ImageURL] [nvarchar] (512) NOT NULL,
[BannerImageURL] [nvarchar] (512) NOT NULL,
[SourceType] [int] NOT NULL,
[DisplaySortOrder] [int] NOT NULL,
[LatestProductCount] [int] NOT NULL,
[CustomPageURL] [nvarchar] (512) NOT NULL,
[CustomPageNewWindow] [int] NOT NULL,
[ShowInTopMenu] [int] NOT NULL,
[Hidden] [int] NOT NULL,
[TemplateName] [nvarchar] (512) NOT NULL,
[PostContentColumnId] [nvarchar] (50) NOT NULL,
[PreContentColumnId] [nvarchar] (50) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[RewriteUrl] [nvarchar] (max) NOT NULL,
[ShowTitle] [int] NOT NULL CONSTRAINT [DF_bvc_Category_ShowTitle] DEFAULT ((1)),
[Criteria] [nvarchar] (max) NOT NULL,
[CustomPageId] [varchar] (36) NOT NULL,
[PreTransformDescription] [ntext] NOT NULL CONSTRAINT [DF_bvc_Category_PreTransformDescription] DEFAULT (N''),
[Keywords] [nvarchar] (max) NOT NULL,
[CustomerChangeableSortOrder] [bit] NOT NULL CONSTRAINT [DF_bvc_Category_CustomerChangeableSortOrder] DEFAULT ((0)),
[CustomPageLayout] [int] NOT NULL CONSTRAINT [DF_bvc_Category_CustomPageLayout] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Category] on [dbo].[bvc_Category]'
GO
ALTER TABLE [dbo].[bvc_Category] ADD CONSTRAINT [PK_bvc_Category] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_Category] on [dbo].[bvc_Category]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Category] ON [dbo].[bvc_Category] ([ParentID])
GO
PRINT N'Creating [dbo].[bvc_ProductFilter]'
GO
CREATE TABLE [dbo].[bvc_ProductFilter]
(
[bvin] [varchar] (36) NOT NULL,
[FilterName] [nvarchar] (300) NOT NULL,
[Criteria] [nvarchar] (max) NOT NULL,
[Page] [nvarchar] (1000) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductFilter_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductFilter] on [dbo].[bvc_ProductFilter]'
GO
ALTER TABLE [dbo].[bvc_ProductFilter] ADD CONSTRAINT [PK_bvc_ProductFilter] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_OrderStatusCode]'
GO
CREATE TABLE [dbo].[bvc_OrderStatusCode]
(
[bvin] [varchar] (36) NOT NULL,
[SystemCode] [int] NOT NULL CONSTRAINT [DF_bvc_OrderStatusCode_SystemCode] DEFAULT ((0)),
[StatusName] [nvarchar] (max) NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_bvc_OrderStatusCode_SortOrder] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_OrderStatusCode_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_OrderStatusCode] on [dbo].[bvc_OrderStatusCode]'
GO
ALTER TABLE [dbo].[bvc_OrderStatusCode] ADD CONSTRAINT [PK_bvc_OrderStatusCode] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_UserQuestions]'
GO
CREATE TABLE [dbo].[bvc_UserQuestions]
(
[bvin] [varchar] (36) NOT NULL,
[QuestionName] [nvarchar] (50) NOT NULL,
[QuestionType] [int] NOT NULL,
[Values] [nvarchar] (max) NOT NULL,
[Order] [int] NOT NULL CONSTRAINT [DF_bvc_UserQuestions_Order] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_UserQuestions_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_UserQuestions] on [dbo].[bvc_UserQuestions]'
GO
ALTER TABLE [dbo].[bvc_UserQuestions] ADD CONSTRAINT [PK_bvc_UserQuestions] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_PolicyBlock]'
GO
CREATE TABLE [dbo].[bvc_PolicyBlock]
(
[bvin] [varchar] (36) NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[Description] [ntext] NOT NULL,
[SortOrder] [int] NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[PolicyID] [varchar] (36) NOT NULL,
[DescriptionPreTransform] [ntext] NOT NULL CONSTRAINT [DF_bvc_PolicyBlock_DescriptionPreTransform] DEFAULT (N''),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_PolicyBlock_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_PolicyBlock] on [dbo].[bvc_PolicyBlock]'
GO
ALTER TABLE [dbo].[bvc_PolicyBlock] ADD CONSTRAINT [PK_bvc_PolicyBlock] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_LineItem]'
GO
CREATE TABLE [dbo].[bvc_LineItem]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[LastUpdated] [datetime] NOT NULL,
[ProductId] [varchar] (36) NOT NULL,
[VariantId] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_LineItem_VariantId] DEFAULT (''),
[Quantity] [int] NOT NULL,
[OrderBvin] [varchar] (36) NOT NULL,
[BasePrice] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_LineItem_BasePrice] DEFAULT ((0)),
[DiscountDetails] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_LineItem_DiscountDetails] DEFAULT (''),
[AdjustedPrice] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_LineItem_AdjustedPrice] DEFAULT ((0)),
[ShippingPortion] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_LineItem_ShippingPortion] DEFAULT ((0)),
[TaxPortion] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_LineItem_TaxPortion] DEFAULT ((0)),
[LineTotal] [decimal] (18, 10) NOT NULL CONSTRAINT [DF_bvc_LineItem_LineTotal] DEFAULT ((0)),
[CustomProperties] [ntext] NOT NULL CONSTRAINT [DF_bvc_LineItem_CustomProperties] DEFAULT (N''),
[QuantityReturned] [int] NOT NULL CONSTRAINT [DF_bvc_LineItem_QuantityReturned] DEFAULT ((0)),
[QuantityShipped] [int] NOT NULL CONSTRAINT [DF_bvc_LineItem_QuantityShipped] DEFAULT ((0)),
[ProductName] [nvarchar] (255) NOT NULL,
[ProductShortDescription] [nvarchar] (max) NOT NULL,
[ProductSku] [nvarchar] (50) NOT NULL,
[StatusCode] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_LineItem_StatusCode] DEFAULT (''),
[StatusName] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_LineItem_StatusName] DEFAULT (N''),
[SelectionData] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_LineItem_SelectionData] DEFAULT (''),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_LineItem_StoreId] DEFAULT ((0)),
[ShippingScheduleId] [bigint] NOT NULL CONSTRAINT [DF_bvc_LineItem_ShippingScheduleId] DEFAULT (''),
[TaxScheduleId] [bigint] NOT NULL CONSTRAINT [DF_bvc_LineItem_TaxScheduleId] DEFAULT (''),
[ProductShippingWeight] [numeric] (10, 4) NOT NULL CONSTRAINT [DF_bvc_LineItem_ShippingWeightSingle] DEFAULT ((0)),
[ProductShippingLength] [numeric] (10, 4) NOT NULL CONSTRAINT [DF_bvc_LineItem_ProductShippingLength] DEFAULT ((0)),
[ProductShippingWidth] [numeric] (10, 4) NOT NULL CONSTRAINT [DF_bvc_LineItem_ProductShippingWidth] DEFAULT ((0)),
[ProductShippingHeight] [numeric] (10, 4) NOT NULL CONSTRAINT [DF_bvc_LineItem_ProductShippingHeight] DEFAULT ((0)),
[ShipFromAddress] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_LineItem_ShipFromAddress] DEFAULT (''),
[ShipFromMode] [int] NOT NULL CONSTRAINT [DF_bvc_LineItem_ShipFromMode] DEFAULT ((1)),
[ShipFromNotificationId] [nvarchar] (50) NOT NULL CONSTRAINT [DF_bvc_LineItem_ShipFromNotificationId] DEFAULT (''),
[ShipSeparately] [bit] NOT NULL CONSTRAINT [DF_bvc_LineItem_ShipSeparately] DEFAULT ((0)),
[ExtraShipCharge] [numeric] (10, 4) NOT NULL CONSTRAINT [DF_bvc_LineItem_ExtraShipCharge] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_LineItem] on [dbo].[bvc_LineItem]'
GO
ALTER TABLE [dbo].[bvc_LineItem] ADD CONSTRAINT [PK_bvc_LineItem] PRIMARY KEY NONCLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_LineItem_1] on [dbo].[bvc_LineItem]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_LineItem_1] ON [dbo].[bvc_LineItem] ([OrderBvin])
GO
PRINT N'Creating [dbo].[bvc_ProductPropertyChoice]'
GO
CREATE TABLE [dbo].[bvc_ProductPropertyChoice]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[PropertyId] [bigint] NOT NULL,
[ChoiceName] [nvarchar] (512) NOT NULL,
[SortOrder] [int] NOT NULL CONSTRAINT [DF_ProductPropertyChoices_SortOrder] DEFAULT ((-1)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductPropertyChoice_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductPropertyChoice] on [dbo].[bvc_ProductPropertyChoice]'
GO
ALTER TABLE [dbo].[bvc_ProductPropertyChoice] ADD CONSTRAINT [PK_bvc_ProductPropertyChoice] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_ProductPropertyChoice] on [dbo].[bvc_ProductPropertyChoice]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductPropertyChoice] ON [dbo].[bvc_ProductPropertyChoice] ([PropertyId])
GO
PRINT N'Creating [dbo].[bvc_Manufacturer]'
GO
CREATE TABLE [dbo].[bvc_Manufacturer]
(
[bvin] [varchar] (36) NOT NULL,
[DisplayName] [nvarchar] (255) NOT NULL,
[EmailAddress] [nvarchar] (255) NOT NULL,
[Address] [ntext] NOT NULL,
[DropShipEmailTemplateId] [varchar] (36) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Manufacturer_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Manufacturer] on [dbo].[bvc_Manufacturer]'
GO
ALTER TABLE [dbo].[bvc_Manufacturer] ADD CONSTRAINT [PK_bvc_Manufacturer] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[bvc_ProductVolumeDiscounts]'
GO
CREATE TABLE [dbo].[bvc_ProductVolumeDiscounts]
(
[bvin] [varchar] (36) NOT NULL,
[ProductID] [varchar] (36) NOT NULL,
[Qty] [int] NOT NULL CONSTRAINT [DF_bvc_ProductVolumeDiscounts_Qty] DEFAULT ((1)),
[DiscountType] [int] NOT NULL,
[Amount] [numeric] (18, 10) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ProductVolumeDiscounts_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_ProductVolumeDiscounts] on [dbo].[bvc_ProductVolumeDiscounts]'
GO
ALTER TABLE [dbo].[bvc_ProductVolumeDiscounts] ADD CONSTRAINT [PK_bvc_ProductVolumeDiscounts] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_ProductVolumeDiscounts] on [dbo].[bvc_ProductVolumeDiscounts]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductVolumeDiscounts] ON [dbo].[bvc_ProductVolumeDiscounts] ([ProductID])
GO
PRINT N'Creating [dbo].[ecommrc_OrderTransactions]'
GO
CREATE TABLE [dbo].[ecommrc_OrderTransactions]
(
[Id] [uniqueidentifier] NOT NULL,
[StoreId] [bigint] NOT NULL,
[OrderId] [varchar] (36) NOT NULL,
[OrderNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_OrderNumber] DEFAULT (''),
[Timestamp] [datetime] NOT NULL,
[Action] [int] NOT NULL,
[Amount] [decimal] (18, 10) NOT NULL,
[CreditCard] [ntext] NOT NULL,
[Success] [bit] NOT NULL,
[Voided] [bit] NOT NULL,
[RefNum1] [nvarchar] (255) NOT NULL,
[RefNum2] [nvarchar] (255) NOT NULL,
[LinkedToTransaction] [nvarchar] (50) NOT NULL,
[Messages] [ntext] NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_Messages] DEFAULT (''),
[CheckNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_CheckNumber] DEFAULT (''),
[PurchaseOrderNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_PurchaseOrderNumber] DEFAULT (''),
[GiftCardNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_GiftCardNumber] DEFAULT (''),
[CompanyAccountNumber] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_OrderTransactions_CompanyAccountNumber] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_ecommrc_OrderTransactions] on [dbo].[ecommrc_OrderTransactions]'
GO
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD CONSTRAINT [PK_ecommrc_OrderTransactions] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_ecommrc_OrderTransactions_StoreId] on [dbo].[ecommrc_OrderTransactions]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_OrderTransactions_StoreId] ON [dbo].[ecommrc_OrderTransactions] ([StoreId])
GO
PRINT N'Creating index [IX_ecommrc_OrderTransactions_OrderBvin] on [dbo].[ecommrc_OrderTransactions]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_OrderTransactions_OrderBvin] ON [dbo].[ecommrc_OrderTransactions] ([OrderId])
GO
PRINT N'Creating [dbo].[bvc_AffiliateReferral]'
GO
CREATE TABLE [dbo].[bvc_AffiliateReferral]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[AffiliateId] [bigint] NOT NULL CONSTRAINT [DF_bvc_AffiliateReferral_AffiliateId] DEFAULT ((0)),
[referrerurl] [nvarchar] (1000) NOT NULL,
[TimeOfReferralUtc] [datetime] NOT NULL CONSTRAINT [DF_bvc_AffiliateReferral_TimeOfReferralUtc] DEFAULT ('2011-01-01'),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_AffiliateReferral_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_AffiliateReferral] on [dbo].[bvc_AffiliateReferral]'
GO
ALTER TABLE [dbo].[bvc_AffiliateReferral] ADD CONSTRAINT [PK_bvc_AffiliateReferral] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_Stores]'
GO
CREATE TABLE [dbo].[ecommrc_Stores]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreName] [nvarchar] (255) NOT NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_ecommrc_Stores_Status] DEFAULT ((1)),
[DateCreated] [datetime] NOT NULL,
[SubscriptionId] [bigint] NOT NULL CONSTRAINT [DF_ecommrc_Stores_SubscriptionId] DEFAULT ((0)),
[PlanId] [int] NOT NULL CONSTRAINT [DF_ecommrc_Stores_PlanId] DEFAULT ((0)),
[CustomUrl] [nvarchar] (255) NOT NULL CONSTRAINT [DF_ecommrc_Stores_CustomUrl] DEFAULT (''),
[CurrentPlanRate] [decimal] (18, 2) NOT NULL CONSTRAINT [DF_ecommrc_Stores_CurrentPlanRate] DEFAULT ((0)),
[CurrentPlanPercent] [decimal] (18, 2) NOT NULL CONSTRAINT [DF_ecommrc_Stores_CurrentPlanPercent] DEFAULT ((0)),
[CurrentPlanDayOfMonth] [int] NOT NULL CONSTRAINT [DF_ecommrc_Stores_CurrentPlanDayOfMonth] DEFAULT ((1)),
[DateCancelled] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_Stores] on [dbo].[ecommrc_Stores]'
GO
ALTER TABLE [dbo].[ecommrc_Stores] ADD CONSTRAINT [PK_ecommrc_Stores] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_UserAccounts]'
GO
CREATE TABLE [dbo].[ecommrc_UserAccounts]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[email] [nvarchar] (255) NOT NULL,
[password] [nvarchar] (255) NOT NULL,
[DateCreated] [datetime] NOT NULL,
[statuscode] [int] NOT NULL CONSTRAINT [DF_ecommrc_UserAccounts_statuscode] DEFAULT ((1)),
[Salt] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_UserAccounts_Salt] DEFAULT (''),
[ResetKey] [nvarchar] (50) NOT NULL CONSTRAINT [DF_ecommrc_UserAccounts_ResetKey] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_ecommrc_UserAccounts] on [dbo].[ecommrc_UserAccounts]'
GO
ALTER TABLE [dbo].[ecommrc_UserAccounts] ADD CONSTRAINT [PK_ecommrc_UserAccounts] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bv_SearchObjects]'
GO
CREATE TABLE [dbo].[bv_SearchObjects]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ObjectType] [int] NOT NULL,
[ObjectId] [nvarchar] (255) NOT NULL,
[Title] [nvarchar] (512) NOT NULL,
[SiteId] [bigint] NOT NULL CONSTRAINT [DF_bv_SearchObjects_SiteId] DEFAULT ((0)),
[LastIndexUtc] [datetime] NOT NULL CONSTRAINT [DF_bv_SearchObjects_LastIndexUtc] DEFAULT (((1)/(1))/(1900))
)
GO
PRINT N'Creating primary key [PK_bv_SearchObject] on [dbo].[bv_SearchObjects]'
GO
ALTER TABLE [dbo].[bv_SearchObjects] ADD CONSTRAINT [PK_bv_SearchObject] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_MailingListMember]'
GO
CREATE TABLE [dbo].[bvc_MailingListMember]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_MailingListMember_StoreId] DEFAULT ((0)),
[ListID] [bigint] NOT NULL,
[EmailAddress] [nvarchar] (255) NOT NULL,
[FirstName] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_MailingListMember_FirstName] DEFAULT (''),
[LastName] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_MailingListMember_LastName] DEFAULT (''),
[LastUpdatedUtc] [datetime] NOT NULL CONSTRAINT [DF_bvc_MailingListMember_LastUpdatedUtc] DEFAULT ('2001-01-01')
)
GO
PRINT N'Creating primary key [PK_bvc_MailingListMember] on [dbo].[bvc_MailingListMember]'
GO
ALTER TABLE [dbo].[bvc_MailingListMember] ADD CONSTRAINT [PK_bvc_MailingListMember] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bv_SearchObjectWords]'
GO
CREATE TABLE [dbo].[bv_SearchObjectWords]
(
[SearchObjectId] [bigint] NOT NULL,
[WordId] [bigint] NOT NULL,
[Score] [int] NOT NULL CONSTRAINT [DF_bv_SearchObjectWords_Score] DEFAULT ((0)),
[SiteId] [bigint] NOT NULL CONSTRAINT [DF_bv_SearchObjectWords_SiteId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bv_SearchObjectWords] on [dbo].[bv_SearchObjectWords]'
GO
ALTER TABLE [dbo].[bv_SearchObjectWords] ADD CONSTRAINT [PK_bv_SearchObjectWords] PRIMARY KEY CLUSTERED  ([SearchObjectId], [WordId], [SiteId])
GO
PRINT N'Creating [dbo].[bvc_MailingList]'
GO
CREATE TABLE [dbo].[bvc_MailingList]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_MailingList_StoreId] DEFAULT ((0)),
[Private] [bit] NOT NULL,
[Name] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_MailingList_Name] DEFAULT (''),
[LastUpdatedUtc] [datetime] NOT NULL CONSTRAINT [DF_bvc_MailingList_LastUpdatedUtc] DEFAULT ('2001-01-01 00:00')
)
GO
PRINT N'Creating primary key [PK_bvc_MailingList_1] on [dbo].[bvc_MailingList]'
GO
ALTER TABLE [dbo].[bvc_MailingList] ADD CONSTRAINT [PK_bvc_MailingList_1] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[bvc_EventLog]'
GO
CREATE TABLE [dbo].[bvc_EventLog]
(
[bvin] [varchar] (36) NOT NULL,
[EventTime] [datetime] NOT NULL,
[Source] [nvarchar] (250) NOT NULL,
[Message] [nvarchar] (max) NOT NULL,
[Severity] [int] NOT NULL CONSTRAINT [DF_bvc_EventLog_Severity] DEFAULT ((0)),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_EventLog_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_EventLog] on [dbo].[bvc_EventLog]'
GO
ALTER TABLE [dbo].[bvc_EventLog] ADD CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_EventLog] on [dbo].[bvc_EventLog]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_EventLog] ON [dbo].[bvc_EventLog] ([StoreId], [Severity])
GO
PRINT N'Creating [dbo].[bvc_Promotions]'
GO
CREATE TABLE [dbo].[bvc_Promotions]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[Mode] [int] NOT NULL CONSTRAINT [DF_bvc_Promotions_Mode] DEFAULT ((0)),
[LastUpdatedUtc] [datetime] NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[CustomerDescription] [nvarchar] (255) NOT NULL CONSTRAINT [DF_bvc_Promotions_CustomerDescription] DEFAULT (''),
[StartDateUtc] [datetime] NOT NULL,
[EndDateUtc] [datetime] NOT NULL,
[IsEnabled] [bit] NOT NULL,
[QualificationsXml] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Promotions_QualificationsXml] DEFAULT (''),
[ActionsXml] [nvarchar] (max) NOT NULL CONSTRAINT [DF_bvc_Promotions_ActionsXml] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_bvc_Promotions] on [dbo].[bvc_Promotions]'
GO
ALTER TABLE [dbo].[bvc_Promotions] ADD CONSTRAINT [PK_bvc_Promotions] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_Promotions_StoreId] on [dbo].[bvc_Promotions]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Promotions_StoreId] ON [dbo].[bvc_Promotions] ([StoreId])
GO
PRINT N'Creating index [IX_bvc_Promotions_Mode] on [dbo].[bvc_Promotions]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Promotions_Mode] ON [dbo].[bvc_Promotions] ([Mode])
GO
PRINT N'Creating index [IX_bvc_Promotions_IsEnabled] on [dbo].[bvc_Promotions]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Promotions_IsEnabled] ON [dbo].[bvc_Promotions] ([IsEnabled])
GO
PRINT N'Creating [dbo].[bvc_OrderCoupon]'
GO
CREATE TABLE [dbo].[bvc_OrderCoupon]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[LastUpdatedUtc] [datetime] NOT NULL,
[CouponCode] [nvarchar] (50) NOT NULL,
[OrderBvin] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_OrderCoupon_StoreId] DEFAULT ((0)),
[UserId] [varchar] (36) NOT NULL CONSTRAINT [DF_bvc_OrderCoupon_UserId] DEFAULT (''),
[IsUsed] [bit] NOT NULL CONSTRAINT [DF_bvc_OrderCoupon_IsUsed] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_OrderCoupon_1] on [dbo].[bvc_OrderCoupon]'
GO
ALTER TABLE [dbo].[bvc_OrderCoupon] ADD CONSTRAINT [PK_bvc_OrderCoupon_1] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_OrderCoupon_OrderBvin] on [dbo].[bvc_OrderCoupon]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_OrderCoupon_OrderBvin] ON [dbo].[bvc_OrderCoupon] ([OrderBvin])
GO
PRINT N'Creating [dbo].[bvc_OrderNote]'
GO
CREATE TABLE [dbo].[bvc_OrderNote]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[OrderId] [varchar] (36) NOT NULL,
[AuditDate] [datetime] NOT NULL,
[Note] [nvarchar] (max) NOT NULL,
[IsPublic] [bit] NOT NULL CONSTRAINT [DF_bvc_OrderNote_IsPublic] DEFAULT ((0)),
[LastUpdatedUtc] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_OrderNote_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_OrderNote_1] on [dbo].[bvc_OrderNote]'
GO
ALTER TABLE [dbo].[bvc_OrderNote] ADD CONSTRAINT [PK_bvc_OrderNote_1] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_OrderNote] on [dbo].[bvc_OrderNote]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_OrderNote] ON [dbo].[bvc_OrderNote] ([OrderId])
GO
PRINT N'Creating [dbo].[bvc_RMA]'
GO
CREATE TABLE [dbo].[bvc_RMA]
(
[bvin] [varchar] (36) NOT NULL,
[OrderBvin] [varchar] (36) NOT NULL,
[Name] [nvarchar] (150) NOT NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[EmailAddress] [nvarchar] (150) NOT NULL,
[PhoneNumber] [nvarchar] (30) NOT NULL,
[Comments] [nvarchar] (max) NOT NULL,
[Status] [int] NOT NULL,
[DateOfReturn] [datetime] NOT NULL CONSTRAINT [DF_bvc_RMA_DateOfReturn] DEFAULT ('01/01/2000'),
[LastUpdated] [datetime] NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_RMA_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_RMA] on [dbo].[bvc_RMA]'
GO
ALTER TABLE [dbo].[bvc_RMA] ADD CONSTRAINT [PK_bvc_RMA] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_RMA_OrderBvin] on [dbo].[bvc_RMA]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_RMA_OrderBvin] ON [dbo].[bvc_RMA] ([OrderBvin])
GO
PRINT N'Creating [dbo].[bvc_OrderPackage]'
GO
CREATE TABLE [dbo].[bvc_OrderPackage]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (max) NOT NULL,
[Width] [decimal] (18, 4) NOT NULL,
[Height] [decimal] (18, 4) NOT NULL,
[Length] [decimal] (18, 4) NOT NULL,
[SizeUnits] [int] NOT NULL,
[Weight] [decimal] (18, 4) NOT NULL,
[WeightUnits] [int] NOT NULL,
[OrderId] [varchar] (36) NOT NULL,
[ShippingProviderId] [varchar] (36) NOT NULL,
[ShippingProviderServiceCode] [nvarchar] (255) NOT NULL,
[HasShipped] [int] NOT NULL,
[TrackingNumber] [nvarchar] (255) NOT NULL,
[ShipDateUtc] [datetime] NOT NULL,
[EstimatedShippingCost] [decimal] (18, 10) NOT NULL,
[Items] [nvarchar] (max) NOT NULL,
[LastUpdatedUtc] [datetime] NOT NULL CONSTRAINT [DF_bvc_OrderPackage_LastUpdatedUtc] DEFAULT ('2011-01-01'),
[CustomProperties] [ntext] NOT NULL CONSTRAINT [DF_bvc_OrderPackage_CustomProperties] DEFAULT (N'n'''),
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_OrderPackage_StoreId] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_OrderPackage] on [dbo].[bvc_OrderPackage]'
GO
ALTER TABLE [dbo].[bvc_OrderPackage] ADD CONSTRAINT [PK_bvc_OrderPackage] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_OrderPackage_OrderId] on [dbo].[bvc_OrderPackage]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_OrderPackage_OrderId] ON [dbo].[bvc_OrderPackage] ([OrderId])
GO
PRINT N'Creating [dbo].[bvc_ProductRelationships]'
GO
CREATE TABLE [dbo].[bvc_ProductRelationships]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ProductId] [nvarchar] (36) NOT NULL,
[RelatedProductId] [nvarchar] (36) NOT NULL,
[IsSubstitute] [bit] NOT NULL CONSTRAINT [DF_bvc_ProductRelationships_IsSubtitute] DEFAULT ((0)),
[SortOrder] [int] NOT NULL CONSTRAINT [DF_bvc_ProductRelationships_SortOrder] DEFAULT ((0)),
[MarketingDescription] [nvarchar] (max) NOT NULL,
[StoreId] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_ProductRelationships] on [dbo].[bvc_ProductRelationships]'
GO
ALTER TABLE [dbo].[bvc_ProductRelationships] ADD CONSTRAINT [PK_bvc_ProductRelationships] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_bvc_ProductRelationships_ProductId] on [dbo].[bvc_ProductRelationships]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductRelationships_ProductId] ON [dbo].[bvc_ProductRelationships] ([ProductId])
GO
PRINT N'Creating index [IX_bvc_ProductRelationships_RelatedProductId] on [dbo].[bvc_ProductRelationships]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_ProductRelationships_RelatedProductId] ON [dbo].[bvc_ProductRelationships] ([RelatedProductId])
GO
PRINT N'Creating [dbo].[bvc_Address]'
GO
CREATE TABLE [dbo].[bvc_Address]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[bvin] [varchar] (36) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[NickName] [nvarchar] (255) NOT NULL,
[FirstName] [nvarchar] (255) NOT NULL,
[MiddleInitial] [nvarchar] (1) NOT NULL,
[LastName] [nvarchar] (255) NOT NULL,
[Company] [nvarchar] (255) NOT NULL,
[Line1] [nvarchar] (255) NOT NULL,
[Line2] [nvarchar] (255) NOT NULL,
[Line3] [nvarchar] (255) NOT NULL,
[City] [nvarchar] (255) NOT NULL,
[RegionBvin] [varchar] (36) NOT NULL,
[RegionName] [nvarchar] (255) NOT NULL,
[PostalCode] [nvarchar] (50) NOT NULL,
[CountryBvin] [varchar] (36) NOT NULL,
[CountryName] [nvarchar] (255) NOT NULL,
[CountyBvin] [varchar] (36) NOT NULL,
[CountyName] [nvarchar] (255) NOT NULL,
[Phone] [nvarchar] (50) NOT NULL,
[Fax] [nvarchar] (50) NOT NULL,
[WebSiteUrl] [nvarchar] (255) NOT NULL,
[UserBvin] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_Address_StoreId] DEFAULT ((0)),
[AddressType] [int] NOT NULL CONSTRAINT [DF_bvc_Address_AddressType] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_bvc_Address] on [dbo].[bvc_Address]'
GO
ALTER TABLE [dbo].[bvc_Address] ADD CONSTRAINT [PK_bvc_Address] PRIMARY KEY NONCLUSTERED  ([bvin])
GO
PRINT N'Creating index [IX_bvc_Address_StoreId] on [dbo].[bvc_Address]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Address_StoreId] ON [dbo].[bvc_Address] ([StoreId])
GO
PRINT N'Creating index [IX_bvc_Address_Type] on [dbo].[bvc_Address]'
GO
CREATE NONCLUSTERED INDEX [IX_bvc_Address_Type] ON [dbo].[bvc_Address] ([AddressType])
GO
PRINT N'Creating [dbo].[bvc_ShippingMethod]'
GO
CREATE TABLE [dbo].[bvc_ShippingMethod]
(
[bvin] [varchar] (36) NOT NULL,
[LastUpdated] [datetime] NOT NULL,
[Adjustment] [decimal] (18, 10) NOT NULL,
[AdjustmentType] [int] NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[ShippingProviderId] [varchar] (36) NOT NULL,
[StoreId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ShippingMethod_StoreId] DEFAULT ((0)),
[ZoneId] [bigint] NOT NULL CONSTRAINT [DF_bvc_ShippingMethod_ZoneId] DEFAULT ((0)),
[Settings] [ntext] NOT NULL CONSTRAINT [DF_bvc_ShippingMethod_Settings] DEFAULT ('')
)
GO
PRINT N'Creating primary key [PK_bvc_ShippingMethod] on [dbo].[bvc_ShippingMethod]'
GO
ALTER TABLE [dbo].[bvc_ShippingMethod] ADD CONSTRAINT [PK_bvc_ShippingMethod] PRIMARY KEY CLUSTERED  ([bvin])
GO
PRINT N'Creating [dbo].[ApiKeys]'
GO
CREATE TABLE [dbo].[ApiKeys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[ApiKey] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ApiKeys] on [dbo].[ApiKeys]'
GO
ALTER TABLE [dbo].[ApiKeys] ADD CONSTRAINT [PK_ApiKeys] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_Table_StoreId] on [dbo].[ApiKeys]'
GO
CREATE NONCLUSTERED INDEX [IX_Table_StoreId] ON [dbo].[ApiKeys] ([StoreId])
GO
PRINT N'Creating [dbo].[bvc_USGeoData]'
GO
CREATE TABLE [dbo].[bvc_USGeoData]
(
[Zip] [varchar] (10) NOT NULL,
[Latitude] [decimal] (18, 10) NOT NULL,
[Longitude] [decimal] (18, 10) NOT NULL,
[City] [varchar] (50) NOT NULL,
[State] [varchar] (2) NOT NULL,
[County] [varchar] (50) NOT NULL,
[ZipType] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_bvc_USGeoData] on [dbo].[bvc_USGeoData]'
GO
ALTER TABLE [dbo].[bvc_USGeoData] ADD CONSTRAINT [PK_bvc_USGeoData] PRIMARY KEY CLUSTERED  ([Zip])
GO
PRINT N'Creating [dbo].[ConversationAuthors]'
GO
CREATE TABLE [dbo].[ConversationAuthors]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[DisplayName] [nvarchar] (50) NOT NULL,
[Bio] [nvarchar] (1024) NOT NULL,
[AuthenticationType] [int] NOT NULL,
[AuthenticationKey] [nvarchar] (max) NOT NULL,
[AccessLevel] [int] NOT NULL,
[Avatar] [varbinary] (max) NULL,
[Verified] [bit] NOT NULL
)
GO
PRINT N'Creating primary key [PK_ConversationAuthors] on [dbo].[ConversationAuthors]'
GO
ALTER TABLE [dbo].[ConversationAuthors] ADD CONSTRAINT [PK_ConversationAuthors] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ConversationMessages]'
GO
CREATE TABLE [dbo].[ConversationMessages]
(
[Id] [bigint] NOT NULL,
[StoreId] [bigint] NOT NULL,
[ConversationId] [bigint] NOT NULL,
[AuthorId] [bigint] NOT NULL,
[Message] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ConversationMessages] on [dbo].[ConversationMessages]'
GO
ALTER TABLE [dbo].[ConversationMessages] ADD CONSTRAINT [PK_ConversationMessages] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_News]'
GO
CREATE TABLE [dbo].[ecommrc_News]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[TimeStampUtc] [datetime] NOT NULL,
[Message] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_News] on [dbo].[ecommrc_News]'
GO
ALTER TABLE [dbo].[ecommrc_News] ADD CONSTRAINT [PK_ecommrc_News] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[ecommrc_StoreDomains]'
GO
CREATE TABLE [dbo].[ecommrc_StoreDomains]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[DomainName] [nvarchar] (255) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ecommrc_StoreDomains] on [dbo].[ecommrc_StoreDomains]'
GO
ALTER TABLE [dbo].[ecommrc_StoreDomains] ADD CONSTRAINT [PK_ecommrc_StoreDomains] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_ecommrc_StoreDomains_StoreId] on [dbo].[ecommrc_StoreDomains]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_StoreDomains_StoreId] ON [dbo].[ecommrc_StoreDomains] ([StoreId])
GO
PRINT N'Creating index [IX_ecommrc_StoreDomains_DomainName] on [dbo].[ecommrc_StoreDomains]'
GO
CREATE NONCLUSTERED INDEX [IX_ecommrc_StoreDomains_DomainName] ON [dbo].[ecommrc_StoreDomains] ([DomainName])
GO
PRINT N'Creating [dbo].[PageVersions]'
GO
CREATE TABLE [dbo].[PageVersions]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[PageId] [nvarchar] (50) NOT NULL,
[AdminName] [nvarchar] (max) NOT NULL,
[AvailableScheduleId] [bigint] NOT NULL,
[AvailableStartDateUtc] [datetime] NOT NULL,
[AvailableEndDateUtc] [datetime] NOT NULL,
[SerializedContent] [nvarchar] (max) NOT NULL,
[PublishedStatus] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_PageVersions] on [dbo].[PageVersions]'
GO
ALTER TABLE [dbo].[PageVersions] ADD CONSTRAINT [PK_PageVersions] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[QueuedTasks]'
GO
CREATE TABLE [dbo].[QueuedTasks]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[StoreId] [bigint] NOT NULL,
[FriendlyName] [nvarchar] (255) NOT NULL,
[TaskProcessorName] [nvarchar] (255) NOT NULL,
[TaskProcessorId] [uniqueidentifier] NOT NULL,
[Payload] [nvarchar] (max) NOT NULL,
[Status] [int] NOT NULL,
[StatusNotes] [nvarchar] (max) NOT NULL,
[StartAtUtc] [datetime] NOT NULL
)
GO
PRINT N'Creating primary key [PK_QueuedTasks] on [dbo].[QueuedTasks]'
GO
ALTER TABLE [dbo].[QueuedTasks] ADD CONSTRAINT [PK_QueuedTasks] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating index [IX_QueuedTasks_StoreId] on [dbo].[QueuedTasks]'
GO
CREATE NONCLUSTERED INDEX [IX_QueuedTasks_StoreId] ON [dbo].[QueuedTasks] ([StoreId])
GO
PRINT N'Creating index [IX_QueuedTasks_Status] on [dbo].[QueuedTasks]'
GO
CREATE NONCLUSTERED INDEX [IX_QueuedTasks_Status] ON [dbo].[QueuedTasks] ([Status])
GO
PRINT N'Creating [dbo].[ToDoItems]'
GO
CREATE TABLE [dbo].[ToDoItems]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[AccountId] [bigint] NOT NULL,
[IsComplete] [bit] NOT NULL,
[SortOrder] [int] NOT NULL,
[Title] [nvarchar] (255) NOT NULL,
[Details] [nvarchar] (max) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ToDoItems] on [dbo].[ToDoItems]'
GO
ALTER TABLE [dbo].[ToDoItems] ADD CONSTRAINT [PK_ToDoItems] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [dbo].[bvc_Address]'
GO
ALTER TABLE [dbo].[bvc_Address] ADD CONSTRAINT [IX_bvc_Address] UNIQUE CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [dbo].[bvc_LineItem]'
GO
ALTER TABLE [dbo].[bvc_LineItem] ADD CONSTRAINT [IX_bvc_LineItem] UNIQUE CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [dbo].[bvc_Order]'
GO
ALTER TABLE [dbo].[bvc_Order] ADD CONSTRAINT [IX_bvc_Order] UNIQUE CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [dbo].[bvc_Product]'
GO
ALTER TABLE [dbo].[bvc_Product] ADD CONSTRAINT [IX_bvc_Product_id] UNIQUE CLUSTERED  ([Id])
GO
PRINT N'Adding constraints to [dbo].[bvc_ProductFileXProduct]'
GO
ALTER TABLE [dbo].[bvc_ProductFileXProduct] ADD CONSTRAINT [IX_bvc_ProductFileXProduct_1] UNIQUE NONCLUSTERED  ([ProductFileId], [ProductId])
GO
PRINT N'Adding constraints to [dbo].[bvc_ProductTypeXProductProperty]'
GO
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] ADD CONSTRAINT [IX_ProductTypeProperties] UNIQUE NONCLUSTERED  ([ProductTypeBvin], [PropertyId])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductXCategory]'
GO
ALTER TABLE [dbo].[bvc_ProductXCategory] WITH NOCHECK ADD
CONSTRAINT [FK_ProductXCategory_bvc_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[bvc_Category] ([bvin]),
CONSTRAINT [FK_ProductXCategory_bvc_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[bvc_Product] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ContentBlock]'
GO
ALTER TABLE [dbo].[bvc_ContentBlock] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_ContentBlock_bvc_ContentColumn] FOREIGN KEY ([ColumnID]) REFERENCES [dbo].[bvc_ContentColumn] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_LineItem]'
GO
ALTER TABLE [dbo].[bvc_LineItem] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_LineItem_bvc_LineItem] FOREIGN KEY ([OrderBvin]) REFERENCES [dbo].[bvc_Order] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_OrderCoupon]'
GO
ALTER TABLE [dbo].[bvc_OrderCoupon] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_OrderCoupon_bvc_Order] FOREIGN KEY ([OrderBvin]) REFERENCES [dbo].[bvc_Order] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_OrderNote]'
GO
ALTER TABLE [dbo].[bvc_OrderNote] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_OrderNote_bvc_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[bvc_Order] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_PolicyBlock]'
GO
ALTER TABLE [dbo].[bvc_PolicyBlock] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_PolicyBlock_bvc_Policy] FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[bvc_Policy] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductInventory]'
GO
ALTER TABLE [dbo].[bvc_ProductInventory] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_ProductInventory_bvc_Product] FOREIGN KEY ([ProductBvin]) REFERENCES [dbo].[bvc_Product] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductPropertyValue]'
GO
ALTER TABLE [dbo].[bvc_ProductPropertyValue] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_ProductPropertyValue_bvc_Product] FOREIGN KEY ([ProductBvin]) REFERENCES [dbo].[bvc_Product] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductFileXProduct]'
GO
ALTER TABLE [dbo].[bvc_ProductFileXProduct] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_ProductFileXProduct_bvc_ProductFile] FOREIGN KEY ([ProductFileId]) REFERENCES [dbo].[bvc_ProductFile] ([bvin]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductTypeXProductProperty]'
GO
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] WITH NOCHECK ADD
CONSTRAINT [FK_ProductTypeProperties_ProductType] FOREIGN KEY ([ProductTypeBvin]) REFERENCES [dbo].[bvc_ProductType] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_RMAItem]'
GO
ALTER TABLE [dbo].[bvc_RMAItem] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_RMAItem_bvc_RMA] FOREIGN KEY ([RMABvin]) REFERENCES [dbo].[bvc_RMA] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_UserXContact]'
GO
ALTER TABLE [dbo].[bvc_UserXContact] WITH NOCHECK ADD
CONSTRAINT [FK_bvc_UserXAffiliate_bvc_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[bvc_User] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bv_SearchObjectWords]'
GO
ALTER TABLE [dbo].[bv_SearchObjectWords] ADD
CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchLexicon] FOREIGN KEY ([WordId]) REFERENCES [dbo].[bv_SearchLexicon] ([Id]),
CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchObjects] FOREIGN KEY ([SearchObjectId]) REFERENCES [dbo].[bv_SearchObjects] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_MailingListMember]'
GO
ALTER TABLE [dbo].[bvc_MailingListMember] ADD
CONSTRAINT [FK_bvc_MailingListMember_bvc_MailingList] FOREIGN KEY ([ListID]) REFERENCES [dbo].[bvc_MailingList] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductOptionsItems]'
GO
ALTER TABLE [dbo].[bvc_ProductOptionsItems] ADD
CONSTRAINT [FK_bvc_ProductOptionsItems_bvc_ProductOptions] FOREIGN KEY ([OptionBvin]) REFERENCES [dbo].[bvc_ProductOptions] ([bvin])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductPropertyChoice]'
GO
ALTER TABLE [dbo].[bvc_ProductPropertyChoice] ADD
CONSTRAINT [FK_bvc_ProductPropertyChoice_bvc_ProductProperty] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[bvc_ProductProperty] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[bvc_ProductXOption]'
GO
ALTER TABLE [dbo].[bvc_ProductXOption] ADD
CONSTRAINT [FK_bvc_ProductXOption_bvc_ProductXOption] FOREIGN KEY ([Id]) REFERENCES [dbo].[bvc_ProductXOption] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[Conversations]'
GO
ALTER TABLE [dbo].[Conversations] ADD
CONSTRAINT [FK_Conversations_ConversationGroups] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[ConversationGroups] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_AuthTokens]'
GO
ALTER TABLE [dbo].[ecommrc_AuthTokens] ADD
CONSTRAINT [FK_ecommrc_AuthTokens_ecommrc_UserAccounts] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ecommrc_UserAccounts] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_OrderTransactions]'
GO
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD
CONSTRAINT [FK_ecommrc_OrderTransactions_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_ShippingZones]'
GO
ALTER TABLE [dbo].[ecommrc_ShippingZones] ADD
CONSTRAINT [FK_ecommrc_ShippingZones_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_StoreSettings]'
GO
ALTER TABLE [dbo].[ecommrc_StoreSettings] ADD
CONSTRAINT [FK_ecommrc_StoreSettings_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_StoresXUsers]'
GO
ALTER TABLE [dbo].[ecommrc_StoresXUsers] ADD
CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id]),
CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_UserAccounts] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ecommrc_UserAccounts] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_Taxes]'
GO
ALTER TABLE [dbo].[ecommrc_Taxes] ADD
CONSTRAINT [FK_ecommrc_Taxes_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id]),
CONSTRAINT [FK_ecommrc_Taxes_ecommrc_TaxSchedules] FOREIGN KEY ([TaxScheduleId]) REFERENCES [dbo].[ecommrc_TaxSchedules] ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[ecommrc_TaxSchedules]'
GO
ALTER TABLE [dbo].[ecommrc_TaxSchedules] ADD
CONSTRAINT [FK_ecommrc_TaxSchedules_ecommrc_Stores] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
