/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC

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

    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.

    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms
    of your choice, provided that you follow these specific guidelines:

	- You also meet the terms and conditions of the license of each
	  independent module
	- You must not alter the default display of the Slatwall name or logo from
	  any part of the application
	- Your custom code must not alter or create any files inside Slatwall,
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets
	the above guidelines as a combined work under the terms of GPL for this program,
	provided that you include the source code of that other code when and as the
	GNU GPL requires distribution of source code.

    If you modify this program, you may extend this exception to your version
    of the program, but you are not obligated to do so.

Notes:

*/


component accessors="true" output="false" displayname="Salesforce" extends="Slatwall.org.Hibachi.HibachiObject" {
	// Variables Saved in this application scope, but not set by end user
	property name="gootenService" type="any";
	property name="gootenDAO" type="any";
	
	public any function init(){
		setGootenService(getService('gootenService'));
		setGootenDAO(getDAO('gootenDAO'));
		return this;
	}

	public any function testIntegration() {
		pushData();
	}
	
	public any function pushData(){
		var orders = getGootenDAO().getUnsyncedGootenOrders();
		for(order in orders){
			getGootenService().checkGootenOrder(order);
		}
	}
	
	public any function pullData(){
		var orders = getGootenDAO().getOpenGootenOrders();
		for(order in orders){
			var gootenOrder = getGootenService().pullGootenOrder(order);
			getGootenService().syncGootenOrderStatus(order, gootenOrder);
		}
		/*Alternately*/
		//Use webhooks
		//When notification is received
			//if item status is delivered, check for/create delivery
	}

	// @hint helper function to return a Setting
	public any function setting(required string settingName, array filterEntities=[], formatValue=false) {
		if(structKeyExists(getIntegration().getSettings(), arguments.settingName)) {
			return getService("settingService").getSettingValue(settingName="integration#getPackageName()##arguments.settingName#", object=this, filterEntities=arguments.filterEntities, formatValue=arguments.formatValue);
		}
		return getService("settingService").getSettingValue(settingName=arguments.settingName, object=this, filterEntities=arguments.filterEntities, formatValue=arguments.formatValue);
	}

	// @hint helper function to return the integration entity that this belongs to
	public any function getIntegration() {
		return getService("integrationService").getIntegrationByIntegrationPackage(getPackageName());
	}

	// @hint helper function to return the packagename of this integration
	public any function getPackageName() {
		return lcase(listGetAt(getClassFullname(), listLen(getClassFullname(), '.') - 1, '.'));
	}

	public any function getContentByResponse(required string response){
		return deserializeJson(arguments.response.fileContent);
	}

}
