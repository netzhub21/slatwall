component extends="PageObject" {
	
	variables.slatAction = "entity.detailtaxcategory";
	
	public any function init(selenium, pageLoadTime) {
		variables.title = selenium.getTitle();
		
		return super.init(argumentCollection=arguments);
	}
	
	public any function clickDeleteLink() {
		selenium.click('link=Delete');
		
		selenium.click('id=confirmYesLink');
		
		var pageLoadTime = waitForPageToLoad();
		
		return new ListTaxCategories(selenium, pageLoadTime);
	}
	
	public any function clickEditLink() {
		selenium.click("link=Edit");
		
		var loadTime = waitForPageToLoad();
		
		return new EditTaxCategory(selenium, loadTime);
	}
	
	public any function clickAddTaxCategoryRateLink(){
		selenium.openWindow(getText_ManualRate());
		
		var loadTime = waitForPageToLoad();
		
		return new CreateTaxCategoryRate(selenium, loadTime);
	}
	
	// =============== GET TEXT =======================
	
	public any function getText_ActiveFlag() {
		return selenium.getText("xpath=//html/body/div[3]/div/div/div[3]/div/dl/dd[1]");
	}
	
	public any function getText_TaxCategoryName() {
		return selenium.getText("xpath=//html/body/div[3]/div/div/div[3]/div/dl/dd[2]");
	}
	
	public any function getText_TaxCategoryCode() {
		return selenium.getText("xpath=//html/body/div[3]/div/div/div[3]/div/dl/dd[3]");
	}
	
	public any function getText_ManualRate() {
		return selenium.getText('xpath=//*[@id="tabrates"]/div/div/ul/li[2]/a');
	}
	

}