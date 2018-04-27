<?xml version="1.0" encoding="UTF-8"?>
<Table tableName="SwCollection">
	<Columns>
		<column name="collectionID" fieldtype="id" />
		<column name="collectionName" />
		<column name="collectionObject" update="false" />
		<column name="collectionConfig" update="false" />
		<column name="reportFlag" update="true" dataType="bit" />
	</Columns>
	<Records>
		<Record collectionID='2c92808362e398b10162e4c489b5000x' collectionName='Average Order Value by Month' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Total Average","propertyIdentifier":"_order.calculatedTotal","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"currency","aggregate":{"aggregateFunction":"AVERAGE","aggregateAlias":"calculatedTotalAverage"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/> 
		<Record collectionID='2c92808362e398b10162e4c3b3d1000b' collectionName='Average Order Value by Week' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Total Average","propertyIdentifier":"_order.calculatedTotal","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"currency","aggregate":{"aggregateFunction":"AVERAGE","aggregateAlias":"calculatedTotalAverage"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4ba71ab000a' collectionName='Average Order Value by Day' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"sorting":{"sortOrder":"asc","active":false,"priority":0},"propertyIdentifier":"_order.orderID","type":"none","isExportable":false},{"isDeletable":true,"aggregate":{"aggregateAlias":"calculatedTotalAverage","aggregateFunction":"AVERAGE"},"isSearchable":true,"isMetric":true,"title":"Total Average","isVisible":true,"ormtype":"string","sorting":{"sortOrder":"asc","active":false,"priority":0},"propertyIdentifier":"_order.calculatedTotal","isExportable":true,"type":"currency"}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"breadCrumbs":[{"cfc":"_order_orderStatusType","entityAlias":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType","rbKey":"Order"}],"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode"}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		
		<Record collectionID='2c92808362e398b10162e4d643040012' collectionName='Units Per Order by Month' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Order Items | Qty. ,define._en_us_missing,define._en_missing","propertyIdentifier":"_order_orderItems.quantity","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"","aggregateAlias":"quantity"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4d515a40011' collectionName='Units Per Order by Week' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Order Items | Qty. ,define._en_us_missing,define._en_missing","propertyIdentifier":"_order_orderItems.quantity","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"","aggregateAlias":"quantity"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4d445420010' collectionName='Units Per Order by Day' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Order Items | Qty. ,define._en_us_missing,define._en_missing","propertyIdentifier":"_order_orderItems.quantity","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"","aggregateAlias":"quantity"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]}]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		
		<Record collectionID='2c92808362e398b10162e4dd77c40015' collectionName='Order count by Month' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CQkHbzGQzJ2ZkO9ygUK4HG9sPcuhiet0","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Orders Count","propertyIdentifier":"_account_orders","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"type":"none","ormtype":"string","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"ordersCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0}}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CQkHbzGQzJ2ZkO9ygUK4HG9sPcuhiet0","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"ChGCr3JMYPPCqVqCBbehaldt02nKuXma","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"Cy98a2f8JqNLAj1cRrCxoQCcu15MmQhf","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CGhsGGzoBvEB8y4lZAwUkmwuS1bdayDd","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CaABqdfzQVRIuE5d8J2BZLC1WEum5fdw","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"CyDwtPr9ZSa6qCG2NkeYM5hyOGo6EHZb","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"CCaGlw1YIEmXTyqimDQppNaHxHWNNrtR","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"CWhCa9hjgb5kio6mwtauJDCyxLV4sYeR","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4dcc1570014' collectionName='Order count by Week' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CVYPv2r2WPNF9gmhdcO8bHQ541cmVI7x","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Orders Count","propertyIdentifier":"_account_orders","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"type":"none","ormtype":"string","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"ordersCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CVYPv2r2WPNF9gmhdcO8bHQ541cmVI7x","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CIMvPoKbNPmgQ3R5SYUz2QrDooMbTUej","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CpKV8TUW944n7zaFQy6pVovNIkuOU7D1","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CME5pXLSqUnmjOXbj9egpp0Ert5USFwO","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CyBBtbgBDeAiryoHIRlufTbIj5hmFDHe","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"Ck9AdM5iyfg517U4Yx7CQgPRe56ExNLw","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"CtvGDI63Ke6RmrBXIFLA4KRVukdlsDmZ","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"Ca6cEiIUkRJBUav7MzamdKbT1OTK9EfR","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4dc04830013' collectionName='Order count by Day' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CzcTYeGlmOhC00mePAPdds8aAQndTHHk","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Orders Count","propertyIdentifier":"_account_orders","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"type":"none","ormtype":"string","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"ordersCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CzcTYeGlmOhC00mePAPdds8aAQndTHHk","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CYUcB5eqGZmreORtwPJODzXZpT4KIyzo","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CjVKP5j25hSOgi55X9eVQhTwVyc8nsRW","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CYWMjRTy4vimokNBKHZ3hqX92j60gzyZ","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CFDKyZxeqE6GYeHEmJK7OUpk2zvRTI4N","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"CKBCyAV9UqqsA4psZmt1gkeCz6bU57gJ","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"Cdf5ljKIqOgMe5TT8zgmfjEEtuBxu3rM","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"CcSeMhVU3EOZ3drxk3arMYaRDqCmYWhe","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>		
		
		<Record collectionID='2c92808362e398b10162e4cd4f39000f' collectionName='New Accounts by Month' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CjRskTZuucIDjaxXDs30ZrVK5gmutmhG","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Created Date Time Count","propertyIdentifier":"_account.createdDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"createdDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CjRskTZuucIDjaxXDs30ZrVK5gmutmhG","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CtPphmZIfzj4IrezXYjgHyy9itz6axGB","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CWDDbvmRsNlR3eTE3mCKVgLmI8llKFJx","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CnBnNe1jf7kdLrdl1cdZzgOIKlAsF8Gs","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CvvC2SRxSKyGZ24vELf2fiVsfbVZD6xl","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"CUabgaPDzPW7cHutarW1Nao0Kgs6451D","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"CIZghNFdsxTTHlh9pK3aZYr4BwjNOJ8J","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"CKi2H0bm36NjZSVaPff9t1qmSIUuo6zm","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4ccaaa4000e' collectionName='New Accounts by Week' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CAgZxi3ZPM5ABYz20ptEz4SUKYpzut0n","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Created Date Time Count","propertyIdentifier":"_account.createdDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"createdDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CAgZxi3ZPM5ABYz20ptEz4SUKYpzut0n","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CoJ6YHLnfGTC1TjNcCUpXnUjov0UtVwi","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CppaAzy2rpOfnel9wZnPphJNCqkWCILV","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CNZy65zwTgNblXhu9ejdOnSFpaOb8sDf","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CP1Brnx7PHlxHibBSRpQG3KoEApm5yWq","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"CBKwOZJoS7OA63EBT2ELVWjSttd6axl3","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"ChiVxTLAwjLlWKcZ99F1DiKq1udeWARh","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"CXY2Mtyipx1oC8E94WIv72NytenZINbl","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808362e398b10162e4cbf677000d' collectionName='New Accounts by Day' collectionObject='Account' collectionConfig='{"baseEntityAlias":"_account","baseEntityName":"Account","columns":[{"search":true,"isSearchable":true,"isVisible":false,"columnID":"CzXOCHCKgEPtRsFv923BCbAwaGe1DqfT","propertyIdentifier":"_account.accountID","editable":false,"hasCellView":false,"isExportable":true,"isDeletable":false,"tooltip":"","title":"accountID","ormtype":"string","type":"none","hasHeaderView":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Created Date Time Count","propertyIdentifier":"_account.createdDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"createdDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[{"propertyIdentifier":"_account.accountID","isVisible":false,"isDeletable":false,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CzXOCHCKgEPtRsFv923BCbAwaGe1DqfT","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.firstName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CwSkjT7qwmzFnftVfZKlFRI1e7P3RP93","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.lastName","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CPzrpTcVThtR3ZIuEDpX9is90MNpSVyO","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.company","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CIw1LJlNcoBnCiMuSHYzOiw6na68aD1L","tdclass":"primary","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryPhoneNumber.phoneNumber","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","columnID":"CkcJ3qIwNyNreksqJilQrlSLb5loSTS6","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.primaryEmailAddress.emailAddress","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"email","columnID":"CYVXmxhsxtIWoViqVp1QvZPTrfCKmGDG","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.guestAccountFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"yesno","columnID":"CiSJTBiSBRYmEbaB7kjNhr850vFK1Cln","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false},{"propertyIdentifier":"_account.organizationFlag","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"boolean","type":"none","columnID":"CzZ2Xu0jtOhAjpYitI7ZASI4MWvYlQ3t","search":true,"editable":false,"hasCellView":false,"hasHeaderView":false}],"filterGroups":[{"filterGroup":[]}],"currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/> 
		
		<Record collectionID='2c92808363025478016303b53db80029' collectionName='Orders Completed by Year' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Date Closed Count","propertyIdentifier":"_order.orderCloseDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"orderCloseDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]},{"displayPropertyIdentifier":"System Code","propertyIdentifier":"_order_orderStatusType.systemCode","comparisonOperator":"=","logicalOperator":"AND","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order","cfc":"_order","propertyIdentifier":"_order"},{"entityAlias":"orderStatusType","cfc":"Type","propertyIdentifier":"_order_orderStatusType","rbKey":"Type"}],"value":"ostClosed","displayValue":"ostClosed","ormtype":"string","conditionDisplay":"Equals"}]}],"joins":[{"associationName":"orderStatusType","alias":"_order_orderStatusType"}],"groupBys":"_order.orderID,_order.orderCloseDateTime","currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808363025478016303b32a570028' collectionName='Orders Completed by Month' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Date Closed Count","propertyIdentifier":"_order.orderCloseDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"orderCloseDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]},{"displayPropertyIdentifier":"System Code","propertyIdentifier":"_order_orderStatusType.systemCode","comparisonOperator":"=","logicalOperator":"AND","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order","cfc":"_order","propertyIdentifier":"_order"},{"entityAlias":"orderStatusType","cfc":"Type","propertyIdentifier":"_order_orderStatusType","rbKey":"Type"}],"value":"ostClosed","displayValue":"ostClosed","ormtype":"string","conditionDisplay":"Equals"}]}],"joins":[{"associationName":"orderStatusType","alias":"_order_orderStatusType"}],"groupBys":"_order.orderID,_order.orderCloseDateTime","currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
		<Record collectionID='2c92808363025478016303b1f9a20027' collectionName='Orders Completed by Week' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Date Closed Count","propertyIdentifier":"_order.orderCloseDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"orderCloseDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]},{"displayPropertyIdentifier":"System Code","propertyIdentifier":"_order_orderStatusType.systemCode","comparisonOperator":"=","logicalOperator":"AND","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order","cfc":"_order","propertyIdentifier":"_order"},{"entityAlias":"orderStatusType","cfc":"Type","propertyIdentifier":"_order_orderStatusType","rbKey":"Type"}],"value":"ostClosed","displayValue":"ostClosed","ormtype":"string","conditionDisplay":"Equals"}]}],"joins":[{"associationName":"orderStatusType","alias":"_order_orderStatusType"}],"groupBys":"_order.orderNumber,_order.orderOpenDateTime,_order.account.firstName,_order.account.lastName,_order.account.company,_order.orderOrigin.orderOriginName,_order.createdDateTime,_order.calculatedTotal,_order.orderType.typeName,_order.orderStatusType.typeName,_order.orderID","currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='true'/>
		<Record collectionID='2c92808363025478016303af6e590026' collectionName='Orders Completed by Day' collectionObject='Order' collectionConfig='{"baseEntityAlias":"_order","baseEntityName":"Order","columns":[{"isDeletable":false,"isSearchable":false,"ormtype":"string","title":"Order ID","isVisible":false,"propertyIdentifier":"_order.orderID","type":"none","isExportable":false,"sorting":{"active":false,"sortOrder":"asc","priority":0}},{"title":"Date Closed Count","propertyIdentifier":"_order.orderCloseDateTime","isVisible":true,"isDeletable":true,"isSearchable":true,"isExportable":true,"ormtype":"string","type":"none","aggregate":{"aggregateFunction":"COUNT","aggregateAlias":"orderCloseDateTimeCount"},"sorting":{"active":false,"sortOrder":"asc","priority":0},"isMetric":true}],"keywordColumns":[],"filterGroups":[{"filterGroup":[{"comparisonOperator":"IN","ormtype":"string","value":"ostNew,ostProcessing,ostOnHold,ostClosed,ostCanceled","hidden":true,"propertyIdentifier":"_order_orderStatusType.systemCode","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order_orderStatusType","cfc":"_order_orderStatusType","propertyIdentifier":"_order_orderStatusType"}]},{"displayPropertyIdentifier":"System Code","propertyIdentifier":"_order_orderStatusType.systemCode","comparisonOperator":"=","logicalOperator":"AND","breadCrumbs":[{"rbKey":"Order","entityAlias":"_order","cfc":"_order","propertyIdentifier":"_order"},{"entityAlias":"orderStatusType","cfc":"Type","propertyIdentifier":"_order_orderStatusType","rbKey":"Type"}],"value":"ostClosed","displayValue":"ostClosed","ormtype":"string","conditionDisplay":"Equals"}]}],"joins":[{"associationName":"orderStatusType","alias":"_order_orderStatusType"}],"groupBys":"_order.orderID","currentPage":1,"pageShow":10,"defaultColumns":false,"dirtyRead":false}' reportFlag='1'/>
	</Records> 
</Table>
