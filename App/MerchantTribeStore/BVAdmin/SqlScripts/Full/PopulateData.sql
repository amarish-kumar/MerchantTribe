		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)

-- Add rows to [dbo].[bvc_ContentColumn]
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('1', N'System Homepage 1', 1, '2005-09-07 22:50:35.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('101', N'System Admin Dashboard 1', 1, '2006-04-13 12:14:58.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('102', N'System Admin Dashboard 2', 1, '2006-04-13 12:15:11.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('103', N'System Admin Dashboard 3', 1, '2006-04-13 12:15:20.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('2', N'System Homepage 2', 1, '2005-09-07 22:50:35.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('201', N'System Account Pages', 1, '2006-05-16 15:47:56.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('202', N'System Service Pages', 1, '2006-05-15 17:40:25.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('3', N'System Homepage 3', 1, '2005-09-07 22:50:35.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('4', N'System Category Page', 1, '2005-09-07 22:50:35.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('5', N'System Product Page', 1, '2005-09-07 22:50:35.000', 0)
INSERT INTO [dbo].[bvc_ContentColumn] ([bvin], [DisplayName], [SystemColumn], [LastUpdated], [StoreId]) VALUES ('601', N'Checkout Page', 1, '2010-01-01 00:00:00.000', 0)
-- Operation applied to 11 rows out of 11

-- Add rows to [dbo].[bvc_HtmlTemplates]
SET IDENTITY_INSERT [dbo].[bvc_HtmlTemplates] ON
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (26, 0, '2011-02-19 16:12:17.810', N'Contact Us Form', N'[[Store.ContactEmail]]', N'Contact Form From [[Store.StoreName]]', N'<h1>Contact Form from [[Store.StoreName]]</h1>', N'', 102)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (27, 0, '2011-02-25 21:43:54.210', N'Drop Shipper Notice', N'[[Store.ContactEmail]]', N'Drop Ship Request: [[Order.OrderNumber]]', N'<html>
 <head>
 <style type="text/css"> A { text-decoration: none; }
	A:link { color: #3366cc; text-decoration: none; }
	A:visited { color: #663399; text-decoration: none; }
	A:active { color: #cccccc; text-decoration: none; }
	A:Hover { text-decoration: underline; }
	BODY, TD, CENTER, P { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.body { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.content { font-family: Arial, Helvetica, sans-serif; font-size: 11px; font-weight: normal; color: #000000; }
	.title { font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; color: #000000; }
	.headline { font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; color: #000000; }
	.message { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 9px; }
	</style>
 </head>
<body bgcolor="#ffffff" LINK="#3366cc" VLINK="#3366cc" ALINK="#3366cc" LEFTMARGIN="0" TOPMARGIN="0">
	<table cellSpacing=1 cellPadding=3 width="100%" border="0" runat="server">
	<tr>
		<td colSpan=2>[[Store.Logo]]</td>
	</tr>
		<TR>
		<TD class=FormLabel vAlign=top align=left width="50%">
		<b>Billed To:</b><br>
		<br>[[Order.BillingAddress]]
		[[Order.UserName]]
		</TD>
		<TD class=FormLabel vAlign=top align=left width="50%">
			<b>Order Number:</b> [[Order.OrderNumber]]<BR>
			<b>Order Time:</b> [[Order.TimeOfOrder]]<br>
			<b>Current Status:</b> [[Order.Status]]&nbsp;<BR>
			<b>Special Instructions:</b> [[Order.Instructions]]&nbsp;<br>
					</TD>		
	</TR>
	<tr>
		<td colspan="2">
			<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			<tr>
                                <td><b>Qty</b></td>
				<td><b>SKU</b></td>
				<td><b>Product Name</b></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>
			[[RepeatingSection]]
			<tr>
				<td colspan="3"><hr></td>
			</tr>
		</table>
				
		</td>
	</tr>
	<tr>
		<td colspan="2"><b>Please retain for your records.</b></td>
	</tr>						
</table>
</body>
</html>', N'<tr><td align=left valign=top>[[LineItem.Quantity]]</td><td align=left valign=top>[[LineItem.Sku]]</td><td align=left valign=top>[[LineItem.ProductName]]<br />[[LineItem.ProductDescription]]<br />[[LineItem.ShippingStatus]]</td></tr>', 200)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (28, 0, '2011-02-25 21:44:15.130', N'Email Friend', N'[[Store.ContactEmail]]', N'A friend has sent you a link from [[Store.StoreName]]', N'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
        "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<style type="text/css" media="screen,print">
	html,
	body {
		margin:0;
		padding:0;
		font-family:"Trebuchet MS", Georgia, Verdana, serif;
		color:#000;
		background:#fff;
	}
	body {
		min-width:720px;
		text-align:center;
	}
	h1 {
		padding:0;
		margin:0;
		font-size:16px;
	}
	p {
		margin:9px 0 0 0;
		padding:0;
		font-size:12px;
		line-height:18px;
	}
	p+p {
		font-style:italic;
		font-size:11px;
	}
	#centerwrap {
		background:#ccc;
		width:720px;
		margin:10px auto;
		padding:10px 0;
		text-align:left;
	}
	#content {
		background:#fff;
		margin:0 10px;
		padding:10px;
	}
    .bottombox {
	    text-align:center;
	    padding:10px;
	    background-color:BlanchedAlmond;
	    border:1px solid black;
	    font-size:10px;
	    width: 200px;
        margin-left: auto;
        margin-right: auto;
	}
	
	#footer {
		text-align:center;
		clear:both;
	}
	</style>
</head>
<body>
<div id="centerwrap">
[[Store.Logo]] 
	<div id="content">
		<h1>Tell a Friend!</h1>
		<p>Greetings!  Your friend has suggested you look at this great deal from [[Store.StoreName]].&nbsp;
            Click on the image below to view this product in our store.</p>
        <p>
            <a href=''[[Store.StandardUrl]][[Product.ProductURL]]''>
               <IMG src=''[[Store.StandardUrl]][[Product.ImageFileSmall]]'' width=''120'' height=''120'' border=''0''>
            </a>
            <br />[[Product.LongDescription]]
            <br />[[Product.SitePrice]]
        </p>
        <p>
            Don''t worry, this e-mail is the only thing you will receive from us unless you subscribe to our [[Store.StoreName]] newsletter.
            This product, along with many others just like it can be found at our store.  These prices won''t last much longer, begin your shopping today.<br />
        </p>
    <div class="bottombox">
       <a href="[[Store.StandardUrl]]">CLICK HERE TO START SHOPPING.</a>
    </div>

</div>
<div id="footer">
	<a href="[[Store.StandardUrl]]">[[Store.StoreName]]</a>
</div>
</div>
</body>
</html>', N'', 101)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (29, 0, '2011-02-25 21:44:28.593', N'Forgot Password Template', N'[[Store.ContactEmail]]', N'Your password has been reset.', N'[[Store.Logo]]<br />
<font face="Arial">Your password has been reset.</font>
<br />&nbsp;<br />
<font face="Arial">Username: <strong>[[User.UserName]]<br />
</strong>Password: <strong>[[NewPassword]]
</strong>
<br />
<br />
You can login with your new information here: [[Store.StoreName]]&nbsp;[[Store.CurrentLocalTime]]
</font>', N'', 100)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (30, 0, '2011-02-25 21:44:38.073', N'Order New Receipt', N'[[Store.ContactEmail]]', N'Receipt for Order [[Order.OrderNumber]] from [[Store.StoreName]]', N'<html>
 <head>
 <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<style type="text/css"> A { text-decoration: none; }
	A:link { color: #3366cc; text-decoration: none; }
	A:visited { color: #663399; text-decoration: none; }
	A:active { color: #cccccc; text-decoration: none; }
	A:Hover { text-decoration: underline; }
	BODY, TD, CENTER, P { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.body { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.content { font-family: Arial, Helvetica, sans-serif; font-size: 11px; font-weight: normal; color: #000000; }
	.title { font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; color: #000000; }
	.headline { font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; color: #000000; }
	.message { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 9px; }
	</style>
 </head>
<body bgcolor="#ffffff" LINK="#3366cc" VLINK="#3366cc" ALINK="#3366cc" LEFTMARGIN="0" TOPMARGIN="0">
	<table cellSpacing=1 cellPadding=3 width="100%" border="0" runat="server">
	<tr>
		<td colSpan=2>[[Store.Logo]]</td>
	</tr>
	<TR>
		<TD class=FormLabel vAlign=top align=left width="50%">
		<b>Billed To:</b><br>
		[[Order.BillingAddress]]<br>
		[[Order.UserName]]
		</TD>
		<TD class=FormLabel vAlign=top align=left width="50%">
			<b>Order Number:</b> [[Order.OrderNumber]]<BR>
			<b>Order Time:</b> [[Order.TimeOfOrder]]<br>
			<b>Current Status:</b> [[Order.Status]]&nbsp;<BR>			
			<b>Promotional Code(s):</b> [[Order.Coupons]]&nbsp;<br>
			<b>Special Instructions:</b> [[Order.Instructions]]&nbsp;<br>			
		</TD>		
	</TR>
	<tr>
		<td colspan="2">
			<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
                                <td><b>Qty</b></td>
				<td><b>SKU</b></td>
				<td><b>Product Name</b></td>
				<td align="right"><b>Unit Price</b></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			[[RepeatingSection]]
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
[[Order.TotalsAsTable]]					
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
		</table>	
		</td>
	</tr>
	<tr>
		<td colspan="2"><b>Please retain for your records.</b></td>
	</tr>						
</table>
</body>
</html>', N'<tr><td align=left valign=top>[[LineItem.Quantity]]</td><td align=left valign=top>[[LineItem.Sku]]</td><td align=left valign=top>[[LineItem.ProductName]]<br />[[LineItem.ProductDescription]]<br />[[LineItem.ShippingStatus]]</td><td align=right valign=top>[[LineItem.AdjustedPrice]]</td></tr>', 1)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (31, 0, '2011-02-25 21:43:40.237', N'Admin Order Receipt', N'[[Store.ContactEmail]]', N'New Order [[Order.OrderNumber]] Received [[Site.SiteName]]', N'<html>
 <head>
 <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<style type="text/css"> A { text-decoration: none; }
    A:link { color: #3366cc; text-decoration: none; }
    A:visited { color: #663399; text-decoration: none; }
    A:active { color: #cccccc; text-decoration: none; }
    A:Hover { text-decoration: underline; }
    BODY, TD, CENTER, P { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
    .body { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
    .content { font-family: Arial, Helvetica, sans-serif; font-size: 11px; font-weight: normal; color: #000000; }
    .title { font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; color: #000000; }
    .headline { font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; color: #000000; }
    .message { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 9px; }
    </style>
 </head>
<body bgcolor="#ffffff" LINK="#3366cc" VLINK="#3366cc" ALINK="#3366cc" LEFTMARGIN="0" TOPMARGIN="0">
    <table cellSpacing=1 cellPadding=3 width="100%" border="0" runat="server">
    <tr>
    	<td colSpan=2>[[Store.Logo]]</td>
    </tr>
    <tr>
    	<td class=FormLabel colSpan=2>
                <hr><a href=[[Order.AdminLink]]>View Order Details</a><br>
                &nbsp;
    	</td>
    </tr>
    <TR>
    	<TD class=FormLabel vAlign=top align=left width="50%">
    	<b>Billed To:</b><br>
    	[[Order.BillingAddress]]<br>
    	[[Order.UserName]]
    	</TD>
    	<TD class=FormLabel vAlign=top align=left width="50%">
    		<b>Order Number:</b> [[Order.OrderNumber]]<BR>
    		<b>Order Time:</b> [[Order.TimeOfOrder]]<br>
    		<b>Current Status:</b> [[Order.Status]]&nbsp;<BR>
    		<b>Promotional Code(s):</b> [[Order.Coupons]]&nbsp;<br>
    		<b>Special Instructions:</b> [[Order.Instructions]]&nbsp;<br>
    	</TD>
    </TR>
    <tr>
    	<td colspan="2">
    		<table border="0" cellspacing="0" cellpadding="5" width="100%">
    		<tr>
    			<td colspan="4"><hr></td>
    		</tr>
    		<tr>
                                <td><b>Qty</b></td>
    			<td><b>SKU</b></td>
    			<td><b>Product Name</b></td>
    			<td align="right"><b>Unit Price</b></td>
    		</tr>
    		<tr>
    			<td colspan="4"><hr></td>
    		</tr>
    		[[RepeatingSection]]
    		<tr>
    			<td colspan="4"><hr></td>
    		</tr>
    		<tr>
    			<td colspan="4" align="right">
    				[[Order.TotalsAsTable]]
    			</td>
    		</tr>
    		<tr>
    			<td colspan="4"><hr></td>
    		</tr>
    	</table>
    	</td>
    </tr>
    <tr>
    	<td colspan="2"><b>Please retain for your records.</b></td>
    </tr>
</table>
</body>
</html>', N'<tr>  <td align=left valign=top>[[LineItem.Quantity]]</td>  <td align=left valign=top>[[LineItem.Sku]]</td>  <td align=left valign=top>[[LineItem.ProductName]]<br />[[LineItem.ProductDescription]]<br />[[LineItem.ShippingStatus]]</td><td align=right valign=top>[[LineItem.AdjustedPrice]]</td></tr>', 2)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (32, 0, '2011-02-25 21:44:47.287', N'Order Shipment', N'[[Store.ContactEmail]]', N'Shipping update for order [[Order.OrderNumber]] from [[Store.StoreName]]', N'<html>
 <head>
<style type="text/css"> A { text-decoration: none; }
	A:link { color: #3366cc; text-decoration: none; }
	A:visited { color: #663399; text-decoration: none; }
	A:active { color: #cccccc; text-decoration: none; }
	A:Hover { text-decoration: underline; }
	BODY, TD, CENTER, P { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.body { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.content { font-family: Arial, Helvetica, sans-serif; font-size: 11px; font-weight: normal; color: #000000; }
	.title { font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; color: #000000; }
	.headline { font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; color: #000000; }
	.message { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 9px; }
        .packageitems { border-collapse: collapse; }
        .itemnamehead { background-color: #999999; }
        .itemquantityhead { background-color: #999999; }
        .alt .itemname { background-color: #aaaaaa; }
        .alt .itemquantity { background-color: #aaaaaa; }
        .itemname { background-color: #ffffff; }
        .itemquantity { background-color: #ffffff; text-align: right; border-left: solid 1px #aaaaaa; }
	</style>
 </head>
<body bgcolor="#ffffff" LINK="#3366cc" VLINK="#3366cc" ALINK="#3366cc" LEFTMARGIN="0" TOPMARGIN="0">
	<table cellSpacing=1 cellPadding=3 width="100%" border="0" runat="server">
	<tr>
		<td colSpan=2>[[Store.Logo]]</td>
	</tr>	
	<TR>
		<TD class=FormLabel vAlign=top align=left width="50%">
		<b>Billed To:</b><br>
		[[Order.BillingAddress]]<br>
		[[Order.UserName]]
		</TD>
		<TD class=FormLabel vAlign=top align=left width="50%">
			<b>Order Number:</b> [[Order.OrderNumber]]<BR>
			<b>Order Time:</b> [[Order.TimeOfOrder]]<br>
			<b>Current Status:</b> [[Order.Status]]&nbsp;<BR>
			<b>Payment Method:</b> [[Order.PaymentMethod]]&nbsp;<br>
			<b>Promotional Code(s):</b> [[Order.Coupons]]&nbsp;<br>
			<b>Special Instructions:</b> [[Order.Instructions]]&nbsp;<br>			
		</TD>		
	</TR>
	<tr>
		<td colspan="2">
			<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
                                <td><b>Shipper</b></td>
				<td><b>Shipping Method</b></td>
				<td><b>Tracking Number</b></td>
				<td><b>Ship Date</b></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			[[RepeatingSection]]
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					[[Order.TotalsAsTable]]
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
		</table>			
		</td>
	</tr>
	<tr>
		<td colspan="2"><b>Please retain for your records.</b></td>
	</tr>						
</table>
</body>
</html>', N'<tr>
  <td align=left valign=top>[[Package.ShipperName]]</td>
  <td align=left valign=top>[[Package.ShipperService]]</td>
  <td align=left valign=top><a href="[[Package.TrackingNumberLink]]">[[Package.TrackingNumber]]</a></td>    
  <td align=left valign=top>[[Package.ShipDate]]</td>
</tr>
<tr>
  <td></td>
  <td colspan="3" align=left valign=top>[[Package.Items]]</td>
</tr>', 4)
INSERT INTO [dbo].[bvc_HtmlTemplates] ([Id], [StoreId], [LastUpdatedUtc], [DisplayName], [FromEmail], [Subject], [Body], [RepeatingSection], [TemplateType]) VALUES (33, 0, '2011-02-25 21:44:56.053', N'Order Update', N'[[Store.ContactEmail]]', N'Order [[Order.OrderNumber]] Update from [[Store.StoreName]]', N'<html>
 <head>
 <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
<style type="text/css"> A { text-decoration: none; }
	A:link { color: #3366cc; text-decoration: none; }
	A:visited { color: #663399; text-decoration: none; }
	A:active { color: #cccccc; text-decoration: none; }
	A:Hover { text-decoration: underline; }
	BODY, TD, CENTER, P { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.body { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 10px; color: #333333; }
	.content { font-family: Arial, Helvetica, sans-serif; font-size: 11px; font-weight: normal; color: #000000; }
	.title { font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; color: #000000; }
	.headline { font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; color: #000000; }
	.message { font-family: Geneva, Verdana, Arial, Helvetica; font-size: 9px; }
        .trackingnumberlist {list-style:none;}
        .trackingnumberlinklist {list-style:none;}
	</style>
 </head>
<body bgcolor="#ffffff" LINK="#3366cc" VLINK="#3366cc" ALINK="#3366cc" LEFTMARGIN="0" TOPMARGIN="0">
	<table cellSpacing=1 cellPadding=3 width="100%" border="0" runat="server">
	<tr>
		<td colSpan=2>[[Store.Logo]]</td>
	</tr>	
	<TR>
		<TD class=FormLabel vAlign=top align=left width="50%">
		<b>Billed To:</b><br>
		[[Order.BillingAddress]]<br>
		[[Order.UserName]]
		</TD>
		<TD class=FormLabel vAlign=top align=left width="50%">
			<b>Order Number:</b> [[Order.OrderNumber]]<BR>
			<b>Order Time:</b> [[Order.TimeOfOrder]]<br>
			<b>Current Status:</b> [[Order.Status]]&nbsp;<BR>			
			<b>Promotional Code(s):</b> [[Order.Coupons]]&nbsp;<br>
			<b>Special Instructions:</b> [[Order.Instructions]]&nbsp;<br>			
		</TD>		
	</TR>
	<tr>
		<td colspan="2">
			<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
                                <td><b>Qty</b></td>
				<td><b>SKU</b></td>
				<td><b>Product Name</b></td>
				<td align="right"><b>Unit Price</b></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			[[RepeatingSection]]
			<tr>
				<td colspan="4"><hr></td>
			</tr>
                        <tr>
				<td colspan="4">Tracking Numbers:</td>
			</tr>
                        <tr>
				<td colspan="4">[[Order.TrackingNumberLinks]]</td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					[[Order.TotalsAsTable]]
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
		</table>			
		</td>
	</tr>
	<tr>
		<td colspan="2"><b>Please retain for your records.</b></td>
	</tr>						
</table>
</body>
</html>', N'<tr><td align=left valign=top>[[LineItem.Quantity]]</td><td align=left valign=top>[[LineItem.Sku]]</td><td align=left valign=top>[[LineItem.ProductName]]<br />[[LineItem.ProductDescription]]<br />[[LineItem.ShippingStatus]]</td><td align=right valign=top>[[LineItem.AdjustedPrice]]</td></tr>', 3)
SET IDENTITY_INSERT [dbo].[bvc_HtmlTemplates] OFF
-- Operation applied to 8 rows out of 16
