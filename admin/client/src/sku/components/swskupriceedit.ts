/// <reference path='../../../typings/slatwallTypescript.d.ts' />
/// <reference path='../../../typings/tsd.d.ts' />
class SWSkuPriceEditController{
    
    public skuId;
    public skuPriceId;
    public minQuantity;
    public maxQuantity;
    public skuCode;
    public price; 
    public currencyCode;
    public bundledSkuSkuId; 
    public bundledSkuCurrencyCode;
    public formName; 
   
    public currencyFilter; 

    public sku; 
    public skuPrice;
    
    public collectionConfig; 
    
    //@ngInject
    constructor(
        private collectionConfigService,
        private utilityService, 
        private $hibachi,
        private $filter
    ){
        this.currencyFilter = this.$filter('swcurrency');
        this.formName = this.utilityService.createID(32);
        if(angular.isUndefined(this.skuId) && angular.isDefined(this.bundledSkuSkuId)){
            this.skuId = this.bundledSkuSkuId;
        }
        if(angular.isUndefined(this.currencyCode) && angular.isDefined(this.bundledSkuCurrencyCode)){
            this.currencyCode = this.bundledSkuCurrencyCode;
        }
        if(angular.isUndefined(this.skuId) 
            && angular.isUndefined(this.sku)
            && angular.isUndefined(this.skuPriceId)
            && angular.isUndefined(this.skuPrice)
        ){
            throw("You must provide either a skuID or a skuPriceID or a sku or a skuPrice to SWSkuPriceSingleEditController");
        } else {
            
            if(angular.isDefined(this.skuId) && angular.isUndefined(this.sku)){
                var skuData = {
                    skuID : this.skuId,
                    skuCode : this.skuCode,
                    currencyCode : this.currencyCode,
                    price : this.currencyFilter(this.price, this.currencyCode, 2, false)
                }
                this.sku = this.$hibachi.populateEntity("Sku", skuData); 
            }

            if(angular.isDefined(this.skuPriceId) && angular.isUndefined(this.skuPrice)){
                var skuPriceData = { 
                    skuPriceId:this.skuPriceId,
                    minQuantity:this.minQuantity,
                    maxQuantity:this.maxQuantity,
                    price: this.currencyFilter(this.price, this.currencyCode, 2, false)
                }
                this.skuPrice = this.$hibachi.populateEntity("SkuPrice", skuPriceData); 
            }
        }
    }    

}

class SWSkuPriceEdit implements ng.IDirective{
    public templateUrl;
    public restrict = 'EA';
    public scope = {}; 
    public bindToController = {
        skuId:"@",
        skuPriceId:"@",
        skuCode:"@",
        price:"@",
        bundledSkuSkuId:"@",
        bundledSkuCurrencyCode:"@",        
        currencyCode:"@",
        sku:"=?",
        skuPrice:"=?"
    };
    public controller = SWSkuPriceEditController;
    public controllerAs="swSkuPriceEdit";
   
   
    public static Factory(){
        var directive = (
            skuPartialsPath,
			slatwallPathBuilder
        )=> new SWSkuPriceEdit(
            skuPartialsPath,
			slatwallPathBuilder
        );
        directive.$inject = [
            'skuPartialsPath',
			'slatwallPathBuilder'
        ];
        return directive;
    }
    constructor(
		skuPartialsPath,
	    slatwallPathBuilder
    ){
        this.templateUrl = slatwallPathBuilder.buildPartialsPath(skuPartialsPath)+"skupriceedit.html";
    }
}
export{
    SWSkuPriceEdit,
    SWSkuPriceEditController
}
