/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

*/
component entityname="SlatwallSku" table="SlatwallSku" persistent=true accessors=true output=false extends="HibachiEntity" cacheuse="transactional" hb_serviceName="skuService" hb_permission="this" {
	
	// Persistent Properties
	property name="skuID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="activeFlag" ormtype="boolean" default="1";
	property name="skuCode" ormtype="string" unique="true" length="50";
	property name="listPrice" ormtype="big_decimal" hb_formatType="currency" default="0";
	property name="price" ormtype="big_decimal" hb_formatType="currency" default="0";
	property name="renewalPrice" ormtype="big_decimal" hb_formatType="currency" default="0";
	property name="imageFile" ormtype="string" length="50";
	property name="userDefinedPriceFlag" ormtype="boolean" default="0";
	
	// Calculated Properties
	property name="calculatedQATS" ormtype="integer";
	
	// Related Object Properties (many-to-one)
	property name="product" fieldtype="many-to-one" fkcolumn="productID" cfc="Product" hb_cascadeCalculate="true";
	property name="subscriptionTerm" cfc="SubscriptionTerm" fieldtype="many-to-one" fkcolumn="subscriptionTermID";
	
	// Related Object Properties (one-to-many)
	property name="alternateSkuCodes" singularname="alternateSkuCode" fieldtype="one-to-many" fkcolumn="skuID" cfc="AlternateSkuCode" inverse="true" cascade="all-delete-orphan";
	property name="attributeValues" singularname="attributeValue" cfc="AttributeValue" type="array" fieldtype="one-to-many" fkcolumn="skuID" cascade="all-delete-orphan" inverse="true";
	property name="skuCurrencies" singularname="skuCurrency" cfc="SkuCurrency" type="array" fieldtype="one-to-many" fkcolumn="skuID" cascade="all-delete-orphan" inverse="true";
	property name="stocks" singularname="stock" fieldtype="one-to-many" fkcolumn="skuID" cfc="Stock" inverse="true" cascade="all-delete-orphan";
	
	// Related Object Properties (many-to-many - owner)
	property name="options" singularname="option" cfc="Option" fieldtype="many-to-many" linktable="SlatwallSkuOption" fkcolumn="skuID" inversejoincolumn="optionID"; 
	property name="accessContents" singularname="accessContent" cfc="Content" type="array" fieldtype="many-to-many" linktable="SlatwallSkuAccessContent" fkcolumn="skuID" inversejoincolumn="contentID"; 
	property name="subscriptionBenefits" singularname="subscriptionBenefit" cfc="SubscriptionBenefit" type="array" fieldtype="many-to-many" linktable="SlatwallSkuSubscriptionBenefit" fkcolumn="skuID" inversejoincolumn="subscriptionBenefitID";
	property name="renewalSubscriptionBenefits" singularname="renewalSubscriptionBenefit" cfc="SubscriptionBenefit" type="array" fieldtype="many-to-many" linktable="SlatwallSkuRenewalSubscriptionBenefit" fkcolumn="skuID" inversejoincolumn="subscriptionBenefitID";
	
	// Related Object Properties (many-to-many - inverse)
	property name="promotionRewards" singularname="promotionReward" cfc="PromotionReward" fieldtype="many-to-many" linktable="SlatwallPromotionRewardSku" fkcolumn="skuID" inversejoincolumn="promotionRewardID" inverse="true";
	property name="promotionRewardExclusions" singularname="promotionRewardExclusion" cfc="PromotionReward" type="array" fieldtype="many-to-many" linktable="SlatwallPromotionRewardExcludedSku" fkcolumn="skuID" inversejoincolumn="promotionRewardID" inverse="true";
	property name="promotionQualifiers" singularname="promotionQualifier" cfc="PromotionQualifier" fieldtype="many-to-many" linktable="SlatwallPromotionQualifierSku" fkcolumn="skuID" inversejoincolumn="promotionQualifierID" inverse="true";
	property name="promotionQualifierExclusions" singularname="promotionQualifierExclusion" cfc="PromotionQualifier" type="array" fieldtype="many-to-many" linktable="SlatwallPromotionQualifierExcludedSku" fkcolumn="skuID" inversejoincolumn="promotionQualifierID" inverse="true";
	property name="priceGroupRates" singularname="priceGroupRate" cfc="PriceGroupRate" fieldtype="many-to-many" linktable="SlatwallPriceGroupRateSku" fkcolumn="skuID" inversejoincolumn="priceGroupRateID" inverse="true";
	property name="physicals" singularname="physical" cfc="Physical" type="array" fieldtype="many-to-many" linktable="SlatwallPhysicalSku" fkcolumn="skuID" inversejoincolumn="physicalID" inverse="true";
	
	// Remote properties
	property name="remoteID" ormtype="string";
	
	// Audit properties
	property name="createdDateTime" hb_populateEnabled="false" ormtype="timestamp";
	property name="createdByAccount" hb_populateEnabled="false" cfc="Account" fieldtype="many-to-one" fkcolumn="createdByAccountID";
	property name="modifiedDateTime" hb_populateEnabled="false" ormtype="timestamp";
	property name="modifiedByAccount" hb_populateEnabled="false" cfc="Account" fieldtype="many-to-one" fkcolumn="modifiedByAccountID";
	
	// Non-Persistent Properties
	property name="adminIcon" persistent="false";
	property name="assignedOrderItemAttributeSetSmartList" persistent="false";
	property name="currentAccountPrice" type="numeric" hb_formatType="currency" persistent="false";
	property name="currencyCode" type="string" persistent="false";
	property name="currencyDetails" type="struct" persistent="false";
	property name="defaultFlag" type="boolean" persistent="false";
	property name="eligibleFulfillmentMethods" type="array" persistent="false";
	property name="imageExistsFlag" type="boolean" persistent="false";
	property name="livePrice" type="numeric" hb_formatType="currency" persistent="false";
	property name="nextEstimatedAvailableDate" type="string" persistent="false";
	property name="optionsDisplay" persistent="false";
	property name="qats" type="numeric" persistent="false";
	property name="salePriceDetails" type="struct" persistent="false";
	property name="salePrice" type="numeric" hb_formatType="currency" persistent="false";
	property name="salePriceDiscountType" type="string" persistent="false";
	property name="salePriceDiscountAmount" type="string" persistent="false";
	property name="salePriceExpirationDateTime" type="date" hb_formatType="datetime" persistent="false";
	property name="stocksDeletableFlag" persistent="false" type="boolean";
	
	
    public boolean function getDefaultFlag() {
    	if(getProduct().getDefaultSku().getSkuID() == getSkuID()) {
    		return true;
    	}
    	return false; 
    }
    
    // used by validate this
    public boolean function isNotDefaultSku() {
		return !getDefaultFlag();
    }
    
    public any function getPriceByCurrencyCode( required string currencyCode ) {
    	if(structKeyExists(getCurrencyDetails(), arguments.currencyCode)) {
    		return getCurrencyDetails()[ arguments.currencyCode ].price;
    	}
    }
    
    public any function getListPriceByCurrencyCode( required string currencyCode ) {
    	if(structKeyExists(getCurrencyDetails(), arguments.currencyCode) && structKeyExists(getCurrencyDetails()[ arguments.currencyCode ], "listPrice")) {
    		return getCurrencyDetails()[ arguments.currencyCode ].listPrice;
    	}
    }
    
    public any function getRenewalPriceByCurrencyCode( required string currencyCode ) {
    	if(structKeyExists(getCurrencyDetails(), arguments.currencyCode) && structKeyExists(getCurrencyDetails()[ arguments.currencyCode ], "renewalPrice")) {
    		return getCurrencyDetails()[ arguments.currencyCode ].renewalPrice;
    	}
    }
    
    // @hint this method validates that this skus has a unique option combination that no other sku has
	public any function hasUniqueOptions() {
		var optionsList = "";
		
		for(var i=1; i<=arrayLen(getOptions()); i++){
			optionsList = listAppend(optionsList, getOptions()[i].getOptionID());
		}
		
		var skus = getProduct().getSkusBySelectedOptions(selectedOptions=optionsList);
		if(!arrayLen(skus) || (arrayLen(skus) == 1 && skus[1].getSkuID() == getSkuID() )) {
			return true;
		}
		
		return false;
	}
	
	// @hint this method validates that this skus has a unique option combination that no other sku has
	public any function hasOneOptionPerOptionGroup() {
		var optionGroupList = "";
		
		for(var i=1; i<=arrayLen(getOptions()); i++){
			if(listFind(optionGroupList, getOptions()[i].getOptionGroup().getOptionGroupID())) {
				return false;
			} else {
				optionGroupList = listAppend(optionGroupList, getOptions()[i].getOptionGroup().getOptionGroupID());	
			}
		}
		
		return true;
	}
	
	//@hint Generates the image path based upon product code, and image options for this sku
	public string function generateImageFileName() {
		var optionString = "";
		for(var option in getOptions()){
			if(option.getOptionGroup().getImageGroupFlag()){
				optionString &= getProduct().setting('productImageOptionCodeDelimiter') & reReplaceNoCase(option.getOptionCode(), "[^a-z0-9\-\_]","","all");
			}
		}
		return reReplaceNoCase(getProduct().getProductCode(), "[^a-z0-9\-\_]","","all") & optionString & ".#setting('globalImageExtension')#";
	}
	
	public string function getOptionsDisplay(delimiter=" ") {
    	var dspOptions = "";
    	for(var i=1;i<=arrayLen(getOptions());i++) {
    		dspOptions = listAppend(dspOptions, getOptions()[i].getOptionName(), arguments.delimiter);
    	}
		return dspOptions;
    }
    
     public struct function getOptionsValueStruct() {
	    	var options = {};
	    	for(var i=1;i<=arrayLen(getOptions());i++) {
	    		options[getOptions()[i].getOptionGroup().getOptionGroupName()] = getOptions()[i].getOptionID();
	    	}
		return options;
    }
    
    public string function displayOptions(delimiter=" ") {
    	var dspOptions = "";
    	for(var i=1;i<=arrayLen(getOptions());i++) {
    		dspOptions = listAppend(dspOptions, getOptions()[i].getOptionName(), arguments.delimiter);
    	}
		return dspOptions;
    }
    
    // Start: Option Helper Methods
    public any function getOptionsByGroupIDStruct() {
		if(!structKeyExists(variables, "OptionsByGroupIDStruct")) {
			variables.OptionsByGroupIDStruct = structNew();
			var options = getOptions();
			for(var i=1; i<=arrayLen(options); i++) {
				if( !structKeyExists(variables.OptionsByGroupIDStruct, options[i].getOptionGroup().getOptionGroupID())){
					variables.OptionsByGroupIDStruct[options[i].getOptionGroup().getOptionGroupID()] = options[i];
				}
			}
		}
		return variables.OptionsByGroupIDStruct;
	}
	
	public any function getOptionByOptionGroupID(required string optionGroupID) {
		var optionsStruct = getOptionsByGroupIDStruct();
		return optionsStruct[arguments.optionGroupID];
	}
    
    // START: Image Methods
    public string function getImageExtension() {
		return listLast(getImageFile(), ".");
	}
	
	public string function getImagePath() {
    	return "#getHibachiScope().getBaseImageURL()#/product/default/#getImageFile()#";
    }
    
    public string function getImage() {
    	return getResizedImage(argumentcollection=arguments);
    }
    
	public string function getResizedImage() {
		
		// Setup Image Path
		arguments.imagePath = getImagePath();
		
		// Alt Title Setting
		if(!structKeyExists(arguments, "alt") && len(setting('imageAltString'))) {
			arguments.alt = stringReplace(setting('imageAltString'));
		}
		
		// Missing Image Path Setting
		if(!structKeyExists(arguments, "missingImagePath")) {
			arguments.missingImagePath = setting('imageMissingImagePath');
		}
		
		// DEPRECATED SIZE LOGIC
		if((structKeyExists(arguments, 1) || structKeyExists(arguments, "size")) && !isNull(getProduct()) && !structKeyExists(arguments, "width") && !structKeyExists(arguments, "height")) {
			if(structKeyExists(arguments, "size")) {
				var thisSize = lcase(arguments.size);
				structDelete(arguments, "size");	
			} else if (structKeyExists(arguments, 1)) {
				var thisSize = lcase(arguments[1]);
				structDelete(arguments, 1);
			}
			if(thisSize eq "l") {
				thisSize = "Large";
			} else if (thisSize eq "m") {
				thisSize = "Medium";
			} else if (thisSize eq "s") {
				thisSize = "Small";
			}
			arguments.width = getProduct().setting("productImage#thisSize#Width");
			arguments.height = getProduct().setting("productImage#thisSize#Height");
		}
		
		return getService("imageService").getResizedImage(argumentCollection=arguments);
	}
	
	public string function getResizedImagePath() {
		
		// Setup Image Path
		arguments.imagePath = getImagePath();
		
		// Missing Image Path Setting
		if(!structKeyExists(arguments, "missingImagePath")) {
			arguments.missingImagePath = setting('imageMissingImagePath');
		}
		
		// DEPRECATED SIZE LOGIC
		if(structKeyExists(arguments, "size") && !isNull(getProduct()) && !structKeyExists(arguments, "width") && !structKeyExists(arguments, "height")) {
			arguments.size = lcase(arguments.size);
			if(arguments.size eq "l") {
				arguments.size = "Large";
			} else if (arguments.size eq "m") {
				arguments.size = "Medium";
			} else {
				arguments.size = "Small";
			}
			arguments.width = getProduct().setting("productImage#arguments.size#Width");
			arguments.height = getProduct().setting("productImage#arguments.size#Height");
			structDelete(arguments, "size");
		}
		
		return getService("imageService").getResizedImagePath(argumentCollection=arguments);
	}
	
	public boolean function getImageExistsFlag() {
		if( fileExists(expandPath(getImagePath())) ) {
			return true;
		} else {
			return false;
		}
	}
	
	// END: Image Methods
	
	//get BaseProductType 
	public any function getBaseProductType() {
		return getProduct().getBaseProductType();
	}
	
	// START: Price Methods
	public numeric function getPriceByPromotion( required any promotion) {
		return getService("promotionService").calculateSkuPriceBasedOnPromotion(sku=this, promotion=arguments.promotion);
	}
	
	public numeric function getPriceByPriceGroup( required any priceGroup) {
		return getService("priceGroupService").calculateSkuPriceBasedOnPriceGroup(sku=this, priceGroup=arguments.priceGroup);
	}
	
	public any function getAppliedPriceGroupRateByPriceGroup( required any priceGroup) {
		return getService("priceGroupService").getRateForSkuBasedOnPriceGroup(sku=this, priceGroup=arguments.priceGroup);
	}
	// END: Price Methods
	
	// Start: Quantity Helper Methods
	public numeric function getQuantity(required string quantityType, string locationID, string stockID) {
		
		// If this is a calculated quantity and locationID exists, then delegate
		if( listFindNoCase("QC,QE,QNC,QATS,QIATS", arguments.quantityType) && structKeyExists(arguments, "locationID") ) {
			var location = getService("locationService").getLocation(arguments.locationID);
			var stock = getService("stockService").getStockBySkuAndLocation(this, location);
			return stock.getQuantity(arguments.quantityType);
		// If this is a calculated quantity and stockID exists, then delegate
		} else if ( listFindNoCase("QC,QE,QNC,QATS,QIATS", arguments.quantityType) && structKeyExists(arguments, "stockID") ) {
			var stock = getService("stockService").getStock(arguments.stockID);
			return stock.getQuantity(arguments.quantityType);
		}
		
		// Standard Logic
		if( !structKeyExists(variables, arguments.quantityType) ) {
			if(listFindNoCase("QOH,QOSH,QNDOO,QNDORVO,QNDOSA,QNRORO,QNROVO,QNROSA", arguments.quantityType)) {
				arguments.skuID = this.getSkuID();
				return getProduct().getQuantity(argumentCollection=arguments);
			} else if(listFindNoCase("QC,QE,QNC,QATS,QIATS", arguments.quantityType)) {
				variables[ arguments.quantityType ] = getService("inventoryService").invokeMethod("get#arguments.quantityType#", {entity=this});
			} else {
				throw("The quantity type you passed in '#arguments.quantityType#' is not a valid quantity type.  Valid quantity types are: QOH, QOSH, QNDOO, QNDORVO, QNDOSA, QNRORO, QNROVO, QNROSA, QC, QE, QNC, QATS, QIATS");
			}
		}
		return variables[ arguments.quantityType ];
	}
	// END: Quantity Helper Methods
	
	// ============ START: Non-Persistent Property Methods =================
	
	public string function getAdminIcon() {
		return getImage(width=55, height=55);
	}
	
	public any function getAssignedOrderItemAttributeSetSmartList(){
		if(!structKeyExists(variables, "assignedOrderItemAttributeSetSmartList")) {
			
			variables.assignedOrderItemAttributeSetSmartList = getService("attributeService").getAttributeSetSmartList();
			
			variables.assignedOrderItemAttributeSetSmartList.addFilter('activeFlag', 1);
			variables.assignedOrderItemAttributeSetSmartList.addFilter('attributeSetType.systemCode', 'astOrderItem');
			
			variables.assignedOrderItemAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "productTypes", "left");
			variables.assignedOrderItemAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "products", "left");
			variables.assignedOrderItemAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "brands", "left");
			variables.assignedOrderItemAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "skus", "left");
			
			var wc = "(";
			wc &= " aslatwallattributeset.globalFlag = 1";
			wc &= " OR aslatwallproducttype.productTypeID IN ('#replace(getProduct().getProductType().getProductTypeIDPath(),",","','","all")#')";
			wc &= " OR aslatwallproduct.productID = '#getProduct().getProductID()#'";
			if(!isNull(getProduct().getBrand())) {
				wc &= " OR aslatwallbrand.brandID = '#getProduct().getBrand().getBrandID()#'";	
			}
			wc &= " OR aslatwallsku.skuID = '#getSkuID()#'";
			wc &= ")";
			
			variables.assignedOrderItemAttributeSetSmartList.addWhereCondition( wc );
		}
		
		return variables.assignedOrderItemAttributeSetSmartList;
	}
	
	public string function getCurrencyCode() {
		if(!structKeyExists(variables, "currencyCode")) {
			variables.currencyCode = this.setting('skuCurrency');
		}
		return variables.currencyCode;
	}
	
	public struct function getCurrencyDetails() {
		if(!structKeyExists(variables, "currencyDetails")) {
			variables.currencyDetails = {};
			
			var eligibleCurrencySL = getService("currencyService").getCurrencySmartList();
			eligibleCurrencySL.addInFilter('currencyCode', setting('skuEligibleCurrencies') );
			
			for(var i = 1; i<=arrayLen(eligibleCurrencySL.getRecords()); i++) {
				
				var thisCurrency = eligibleCurrencySL.getRecords()[i];
				
				variables.currencyDetails[ thisCurrency.getCurrencyCode() ] = {};
				variables.currencyDetails[ thisCurrency.getCurrencyCode() ].skuCurrencyID = "";
				
				// Check to see if thisCurrency is the same as the default currency
				if(thisCurrency.getCurrencyCode() eq this.setting('skuCurrency')) {
					if(!isNull(getRenewalPrice())) {
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPrice = getRenewalPrice();
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPriceFormatted = getFormattedValue("renewalPrice");
					}
					if(!isNull(getListPrice())) {
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPrice = getListPrice();
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPriceFormatted = getFormattedValue("listPrice");
					}
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].price = getPrice();
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].priceFormatted = getFormattedValue("price");
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].converted = false;
				}
				// Look through the definitions to see if this currency is defined for this sku
				for(var c=1; c<=arrayLen(getSkuCurrencies()); c++) {
					if(getSkuCurrencies()[c].getCurrencyCode() eq thisCurrency.getCurrencyCode()) {
						if(!isNull(getSkuCurrencies()[c].getRenewalPrice())) {
							variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPrice = getSkuCurrencies()[c].getRenewalPrice();
							variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPriceFormatted = getSkuCurrencies()[c].getFormattedValue("renewalPrice");
						}
						if(!isNull(getSkuCurrencies()[c].getListPrice())) {
							variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPrice = getSkuCurrencies()[c].getListPrice();
							variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPriceFormatted = getSkuCurrencies()[c].getFormattedValue("listPrice");
						}
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].price = getSkuCurrencies()[c].getPrice();
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].priceFormatted = getSkuCurrencies()[c].getFormattedValue("price");
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].converted = false;
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].skuCurrencyID = getSkuCurrencies()[c].getSkuCurrencyID();
					}
				}
				// Use a conversion mechinism
				if(!structKeyExists(variables.currencyDetails[ thisCurrency.getCurrencyCode() ], "price")) {
					if(!isNull(getRenewalPrice())) {
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPrice = getService("currencyService").convertCurrency(getRenewalPrice(), this.setting('skuCurrency'), thisCurrency.getCurrencyCode());
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPriceFormatted = formatValue( variables.currencyDetails[ thisCurrency.getCurrencyCode() ].renewalPrice, "currency", {currencyCode=thisCurrency.getCurrencyCode()});
					}
					if(!isNull(getListPrice())) {
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPrice = getService("currencyService").convertCurrency(getListPrice(), this.setting('skuCurrency'), thisCurrency.getCurrencyCode());
						variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPriceFormatted = formatValue( variables.currencyDetails[ thisCurrency.getCurrencyCode() ].listPrice, "currency", {currencyCode=thisCurrency.getCurrencyCode()});
					}
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].price = getService("currencyService").convertCurrency(getPrice(), this.setting('skuCurrency'), thisCurrency.getCurrencyCode());
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].priceFormatted = formatValue( variables.currencyDetails[ thisCurrency.getCurrencyCode() ].price, "currency", {currencyCode=thisCurrency.getCurrencyCode()});
					variables.currencyDetails[ thisCurrency.getCurrencyCode() ].converted = true;
				}
			}
		}
		return variables.currencyDetails;
	}
	
	public any function getCurrentAccountPrice() {
		if(!structKeyExists(variables, "currentAccountPrice")) {
			variables.currentAccountPrice = getService("priceGroupService").calculateSkuPriceBasedOnCurrentAccount(sku=this);
		}
		return variables.currentAccountPrice;
	}
	
	public string function getNextEstimatedAvailableDate() {
		if(!structKeyExists(variables, "nextEstimatedAvailableDate")) {
			if(getQuantity("QIATS")) {
				return dateFormat(now(), setting('globalDateFormat'));
			}
			var quantityNeeded = getQuantity("QNC") * -1;
			var dates = getProduct().getEstimatedReceivalDates( skuID=getSkuID() );
			for(var i = 1; i<=arrayLen(dates); i++) {
				
				if(quantityNeeded lt dates[i].quantity) {
					if(dates[i].estimatedReceivalDateTime gt now()) {
						return dateFormat(dates[i].estimatedReceivalDateTime, setting('globalDateFormat'));	
					}
					return dateFormat(now(), setting('globalDateFormat'));
				} else {
					quantityNeeded - dates[i].quantity;
				}
			}
		}
		
		return "";
	}
	
	public any function getLivePrice() {
		if(!structKeyExists(variables, "livePrice")) {
			// Create a prices array, and add the 
			var prices = [getPrice()];
			
			// Add the current account price, and sale price
			arrayAppend(prices, getSalePrice());
			arrayAppend(prices, getCurrentAccountPrice());
			
			// Sort by best price
			arraySort(prices, "numeric", "asc");
			
			// set that in the variables scope
			variables.livePrice = prices[1];
		}
		return variables.livePrice;
	}
	
	public any function getQATS() {
		return getQuantity("QATS");
	}
	
	public any function getSalePriceDetails() {
		if(!structKeyExists(variables, "salePriceDetails")) {
			variables.salePriceDetails = getProduct().getSkuSalePriceDetails( getSkuID() );
		}
		return variables.salePriceDetails;
	}
	
	public any function getSalePrice() {
		if(structKeyExists(getSalePriceDetails(), "salePrice")) {
			return getSalePriceDetails()[ "salePrice"];
		}
		return getPrice();
	}
	
	public any function getSalePriceDiscountType() {
		if(structKeyExists(getSalePriceDetails(), "salePriceDiscountType")) {
			return getSalePriceDetails()[ "salePriceDiscountType"];
		}
		return "";
	}
	
	public any function getSalePriceExpirationDateTime() {
		if(structKeyExists(getSalePriceDetails(), "salePriceExpirationDateTime")) {
			return getSalePriceDetails()[ "salePriceExpirationDateTime"];
		}
		return "";
	}
	
	public boolean function getStocksDeletableFlag() {
		if(!structKeyExists(variables, "stocksDeletableFlag")) {
			variables.stocksDeletableFlag = getService("skuService").getSkuStocksDeletableFlag( skuID=this.getSkuID() );
		}
		return variables.stocksDeletableFlag;
	}
	
	public array function getEligibleFulfillmentMethods() {
		if(!structKeyExists(variables, "eligibleFulfillmentMethods")) {
			var sl = getService("fulfillmentService").getFulfillmentMethodSmartList();
			sl.addInFilter('fulfillmentMethodID', setting('skuEligibleFulfillmentMethods'));
			sl.addOrder('sortOrder|ASC');
			variables.eligibleFulfillmentMethods = sl.getRecords();
		}
		return variables.eligibleFulfillmentMethods;
	}
	
	// ============  END:  Non-Persistent Property Methods =================
		
	// ============= START: Bidirectional Helper Methods ===================
	
	// Product (many-to-one)
	public void function setProduct(required any product) {
		variables.product = arguments.product;
		if(isNew() or !arguments.product.hasSku( this )) {
			arrayAppend(arguments.product.getSkus(), this);
		}
	}
	public void function removeProduct(any product) {
		if(!structKeyExists(arguments, "product")) {
			arguments.product = variables.product;
		}
		var index = arrayFind(arguments.product.getSkus(), this);
		if(index > 0) {
			arrayDeleteAt(arguments.product.getSkus(), index);
		}
		structDelete(variables, "product");
	}
	
	// SubscriptionTerm (many-to-one)    
	public void function setSubscriptionTerm(required any subscriptionTerm) {    
		variables.subscriptionTerm = arguments.subscriptionTerm;    
		if(isNew() or !arguments.subscriptionTerm.hasSku( this )) {    
			arrayAppend(arguments.subscriptionTerm.getSkus(), this);    
		}    
	}    
	public void function removeSubscriptionTerm(any subscriptionTerm) {    
		if(!structKeyExists(arguments, "subscriptionTerm")) {    
			arguments.subscriptionTerm = variables.subscriptionTerm;    
		}    
		var index = arrayFind(arguments.subscriptionTerm.getSkus(), this);    
		if(index > 0) {    
			arrayDeleteAt(arguments.subscriptionTerm.getSkus(), index);    
		}    
		structDelete(variables, "subscriptionTerm");    
	}
	
	// Alternate Sku Codes (one-to-many)
	public void function addAlternateSkuCode(required any alternateSkuCode) {
		arguments.alternateSkuCode.setSku( this );
	}
	public void function removeAlternateSkuCode(required any alternateSkuCode) {
		arguments.alternateSkuCode.removeSku( this );
	}

	// Attribute Values (one-to-many)    
	public void function addAttributeValue(required any attributeValue) {    
		arguments.attributeValue.setSku( this );    
	}    
	public void function removeAttributeValue(required any attributeValue) {    
		arguments.attributeValue.removeSku( this );    
	}
	
	// Sku Currencies (one-to-many)    
	public void function addSkuCurrency(required any skuCurrency) {    
		arguments.skuCurrency.setSku( this );    
	}    
	public void function removeSkuCurrency(required any skuCurrency) {    
		arguments.skuCurrency.removeSku( this );    
	}
	
	// Stocks (one-to-many)
	public void function addStock(required any stock) {
		arguments.stock.setSku( this );
	}
	public void function removeStock(required any stock) {
		arguments.stock.removeSku( this );
	}
	
	// Promotion Rewards (many-to-many - inverse)
	public void function addPromotionReward(required any promotionReward) {
		arguments.promotionReward.addSku( this );
	}
	public void function removePromotionReward(required any promotionReward) {
		arguments.promotionReward.removeSku( this );
	}

	// Promotion Reward Exclusions (many-to-many - inverse)    
	public void function addPromotionRewardExclusion(required any promotionReward) {    
		arguments.promotionReward.addExcludedSku( this );    
	}
	public void function removePromotionRewardExclusion(required any promotionReward) {    
		arguments.promotionReward.removeExcludedSku( this );    
	}
	
	// Promotion Qualifiers (many-to-many - inverse)
	public void function addPromotionQualifier(required any promotionQualifier) {
		arguments.promotionQualifier.addSku( this );
	}
	public void function removePromotionQualifier(required any promotionQualifier) {
		arguments.promotionQualifier.removeSku( this );
	}
	
	// Promotion Qualifier Exclusions (many-to-many - inverse)    
	public void function addPromotionQualifierExclusion(required any promotionQualifier) {    
		arguments.promotionQualifier.addExcludedSku( this );    
	}    
	public void function removePromotionQualifierExclusion(required any promotionQualifier) {    
		arguments.promotionQualifier.removeExcludedSku( this );    
	}
	
	// Access Contents (many-to-many - owner)    
	public void function addAccessContent(required any accessContent) {    
		if(isNew() or !hasAccessContent(arguments.accessContent)) {    
			arrayAppend(variables.accessContents, arguments.accessContent);    
		}    
		if(arguments.accessContent.isNew() or !arguments.accessContent.hasSku( this )) {    
			arrayAppend(arguments.accessContent.getSkus(), this);    
		}    
	}    
	public void function removeAccessContent(required any accessContent) {    
		var thisIndex = arrayFind(variables.accessContents, arguments.accessContent);    
		if(thisIndex > 0) {    
			arrayDeleteAt(variables.accessContents, thisIndex);    
		}    
		var thatIndex = arrayFind(arguments.accessContent.getSkus(), this);    
		if(thatIndex > 0) {    
			arrayDeleteAt(arguments.accessContent.getSkus(), thatIndex);    
		}    
	}
	
	// Subscription Benefits (many-to-many - owner)    
	public void function addSubscriptionBenefit(required any subscriptionBenefit) {    
		if(arguments.subscriptionBenefit.isNew() or !hasSubscriptionBenefit(arguments.subscriptionBenefit)) {    
			arrayAppend(variables.subscriptionBenefits, arguments.subscriptionBenefit);    
		}    
		if(isNew() or !arguments.subscriptionBenefit.hasSku( this )) {    
			arrayAppend(arguments.subscriptionBenefit.getSkus(), this);    
		}    
	}    
	public void function removeSubscriptionBenefit(required any subscriptionBenefit) {    
		var thisIndex = arrayFind(variables.subscriptionBenefits, arguments.subscriptionBenefit);    
		if(thisIndex > 0) {    
			arrayDeleteAt(variables.subscriptionBenefits, thisIndex);    
		}    
		var thatIndex = arrayFind(arguments.subscriptionBenefit.getSkus(), this);    
		if(thatIndex > 0) {    
			arrayDeleteAt(arguments.subscriptionBenefit.getSkus(), thatIndex);    
		}    
	}
	
	// Physicals (many-to-many - inverse)
	public void function addPhysical(required any physical) {
		arguments.physical.addSku( this );
	}
	public void function removePhysical(required any physical) {
		arguments.physical.removeSku( this );
	}
	
	// =============  END:  Bidirectional Helper Methods ===================
	
	// ================== START: Overridden Methods ========================
	
	public string function getSimpleRepresentationPropertyName() {
    	return "skuCode";
    }
    
    public any function getAssignedAttributeSetSmartList(){
		if(!structKeyExists(variables, "assignedAttributeSetSmartList")) {
			
			variables.assignedAttributeSetSmartList = getService("attributeService").getAttributeSetSmartList();
			
			variables.assignedAttributeSetSmartList.addFilter('activeFlag', 1);
			variables.assignedAttributeSetSmartList.addFilter('attributeSetType.systemCode', 'astSku');
			
			variables.assignedAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "productTypes", "left");
			variables.assignedAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "products", "left");
			variables.assignedAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "brands", "left");
			variables.assignedAttributeSetSmartList.joinRelatedProperty("SlatwallAttributeSet", "skus", "left");
			
			var wc = "(";
			wc &= " aslatwallattributeset.globalFlag = 1";
			wc &= " OR aslatwallproducttype.productTypeID IN ('#replace(getProduct().getProductType().getProductTypeIDPath(),",","','","all")#')";
			wc &= " OR aslatwallproduct.productID = '#getProduct().getProductID()#'";
			if(!isNull(getProduct().getBrand())) {
				wc &= " OR aslatwallbrand.brandID = '#getProduct().getBrand().getBrandID()#'";	
			}
			wc &= " OR aslatwallsku.skuID = '#getSkuID()#'";
			wc &= ")";
			
			variables.assignedAttributeSetSmartList.addWhereCondition( wc );
		}
		
		return variables.assignedAttributeSetSmartList;
	}
    
    // @help we override this so that the onMM below will work
	public struct function getPropertyMetaData(string propertyName) {
		
		// if the len is 32 them this propertyName is probably an optionGroupID
		if(len(arguments.propertyName) eq "32") {
			for(var i=1; i<=arrayLen(getOptions()); i++) {
				if(getOptions()[i].getOptionGroup().getOptionGroupID() == arguments.propertyName) {
					return getOptions()[i].getPropertyMetaData('optionName');
				}
			}
		}
		
		return super.getPropertyMetaData(argumentCollection=arguments);
	}
	
    
    // @hint we override the oMM to look for options by optionGroupID
 	public any function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
 		
		// getXXX() 			Where XXX is a optionGroupID
		if (left(arguments.missingMethodName, 3) == "get") {
			
			var potentialOptionGroupID = right(arguments.missingMethodName, len(arguments.missingMethodName)-3);
			
			for(var i=1; i<=arrayLen(getOptions()); i++) {
				if(getOptions()[i].getOptionGroup().getOptionGroupID() == potentialOptionGroupID) {
					return getOptions()[i].getOptionName();
				}
			}
		}
		
		return super.onMissingMethod(argumentCollection=arguments);
	}
	
	// ==================  END:  Overridden Methods ========================
	
	// =================== START: ORM Event Hooks  =========================
	
	// ===================  END:  ORM Event Hooks  =========================
}
