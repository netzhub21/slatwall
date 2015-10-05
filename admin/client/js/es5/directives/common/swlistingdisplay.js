/// <reference path='../../../../../client/typings/slatwallTypescript.d.ts' />
/// <reference path='../../../../../client/typings/tsd.d.ts' />
var slatwalladmin;
(function (slatwalladmin) {
    'use strict';
    var SWListingDisplayController = (function () {
        function SWListingDisplayController($scope, $element, $transclude, $slatwall, partialsPath, utilityService, collectionConfigService, paginationService) {
            var _this = this;
            this.$scope = $scope;
            this.$element = $element;
            this.$transclude = $transclude;
            this.$slatwall = $slatwall;
            this.partialsPath = partialsPath;
            this.utilityService = utilityService;
            this.collectionConfigService = collectionConfigService;
            this.paginationService = paginationService;
            /* local state variables */
            this.columns = [];
            this.allpropertyidentifiers = "";
            this.allprocessobjectproperties = "false";
            this.selectable = false;
            this.multiselectable = false;
            this.expandable = false;
            this.sortable = false;
            this.exampleEntity = "";
            this.buttonGroup = [];
            this.getCollection = function () {
                _this.collectionConfig.setPageShow(_this.paginator.getPageShow());
                _this.collectionConfig.setCurrentPage(_this.paginator.getCurrentPage());
                _this.collectionConfig.setKeywords(_this.paginator.keywords);
                _this.collectionPromise = _this.collectionConfig.getEntity();
                _this.collectionPromise.then(function (data) {
                    _this.collectionData = data;
                    _this.collectionData.pageRecords = _this.collectionData.pageRecords || _this.collectionData.records;
                    _this.paginator.setPageRecordsInfo(_this.collectionData);
                    //prepare an exampleEntity for use
                    _this.init();
                });
                return _this.collectionPromise;
            };
            this.escapeRegExp = function (str) {
                return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
            };
            this.replaceAll = function (str, find, replace) {
                return str.replace(new RegExp(_this.escapeRegExp(find), 'g'), replace);
            };
            this.init = function () {
                //set defaults if value is not specified
                //this.edit = this.edit || $location.edit
                _this.recordProcessButtonDisplayFlag = _this.recordProcessButtonDisplayFlag || true;
                _this.collectionConfig = _this.collectionConfig || _this.collectionData.collectionConfig;
                _this.collectionID = _this.collectionData.collectionID;
                _this.collectionObject = _this.collectionData.collectionObject;
                _this.norecordstext = _this.$slatwall.getRBKey('entity.' + _this.collectionObject + '.norecords');
                //Setup Sortability
                if (_this.sortProperty && _this.sortProperty.length) {
                }
                //Setup the admin meta info
                _this.administrativeCount = 0;
                //Detail
                if (_this.recordDetailAction && _this.recordDetailAction.length) {
                    _this.administrativeCount++;
                    _this.adminattributes = _this.getAdminAttributesByType('detail');
                }
                //Edit
                if (_this.recordEditAction && _this.recordEditAction.length) {
                    _this.administrativeCount++;
                    _this.adminattributes = _this.getAdminAttributesByType('edit');
                }
                //Delete
                if (_this.recordDeleteAction && _this.recordDeleteAction.length) {
                    _this.administrativeCount++;
                    _this.adminattributes = _this.getAdminAttributesByType('delete');
                }
                //Process
                if (_this.recordProcessAction && _this.recordProcessAction.length && _this.recordProcessButtonDisplayFlag) {
                    _this.administrativeCount++;
                    _this.tableattributes = _this.utilityService.listAppend(_this.tableattributes, 'data-processcontext="' + _this.recordProcessContext + '"', " ");
                    _this.tableattributes = _this.utilityService.listAppend(_this.tableattributes, 'data-processentity="' + _this.recordProcessEntity.getClassName() + '"', " ");
                    _this.tableattributes = _this.utilityService.listAppend(_this.tableattributes, 'data-processentityid="' + _this.recordProcessEntity.getPrimaryIDValue() + '"', " ");
                    _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-processaction="' + _this.recordProcessAction + '"', " ");
                    _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-processcontext="' + _this.recordProcessContext + '"', " ");
                    _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-processquerystring="' + _this.recordProcessQueryString + '"', " ");
                    _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-processupdatetableid="' + _this.recordProcessUpdateTableID + '"', " ");
                }
                //Setup the primary representation column if no columns were passed in
                /*
                <cfif not arrayLen(thistag.columns)>
                    <cfset arrayAppend(thistag.columns, {
                        propertyIdentifier = thistag.exampleentity.getSimpleRepresentationPropertyName(),
                        title = "",
                        tdClass="primary",
                        search = true,
                        sort = true,
                        filter = false,
                        range = false,
                        editable = false,
                        buttonGroup = true
                    }) />
                </cfif>
                */
                /*
                <!--- Setup the list of all property identifiers to be used later --->
                <cfloop array="#thistag.columns#" index="column">
        
                    <!--- If this is a standard propertyIdentifier --->
                    <cfif len(column.propertyIdentifier)>
        
                        <!--- Add to the all property identifiers --->
                        <cfset thistag.allpropertyidentifiers = listAppend(thistag.allpropertyidentifiers, column.propertyIdentifier) />
        
                        <!--- Check to see if we need to setup the dynamic filters, ect --->
                        <cfif not len(column.search) || not len(column.sort) || not len(column.filter) || not len(column.range)>
        
                            <!--- Get the entity object to get property metaData --->
                            <cfset thisEntityName = attributes.hibachiScope.getService("hibachiService").getLastEntityNameInPropertyIdentifier( attributes.smartList.getBaseEntityName(), column.propertyIdentifier ) />
                            <cfset thisPropertyName = listLast( column.propertyIdentifier, "." ) />
                            <cfset thisPropertyMeta = attributes.hibachiScope.getService("hibachiService").getPropertyByEntityNameAndPropertyName( thisEntityName, thisPropertyName ) />
        
                            <!--- Setup automatic search, sort, filter & range --->
                            <cfif not len(column.search) && (!structKeyExists(thisPropertyMeta, "persistent") || thisPropertyMeta.persistent) && (!structKeyExists(thisPropertyMeta, "ormType") || thisPropertyMeta.ormType eq 'string')>
                                <cfset column.search = true />
                            <cfelseif !isBoolean(column.search)>
                                <cfset column.search = false />
                            </cfif>
                            <cfif not len(column.sort) && (!structKeyExists(thisPropertyMeta, "persistent") || thisPropertyMeta.persistent)>
                                <cfset column.sort = true />
                            <cfelseif !isBoolean(column.sort)>
                                <cfset column.sort = false />
                            </cfif>
                            <cfif not len(column.filter) && (!structKeyExists(thisPropertyMeta, "persistent") || thisPropertyMeta.persistent)>
                                <cfset column.filter = false />
        
                                <cfif structKeyExists(thisPropertyMeta, "ormtype") && thisPropertyMeta.ormtype eq 'boolean'>
                                    <cfset column.filter = true />
                                </cfif>
                                <!---
                                <cfif !column.filter && listLen(column.propertyIdentifier, '._') gt 1>
        
                                    <cfset oneUpPropertyIdentifier = column.propertyIdentifier />
                                    <cfset oneUpPropertyIdentifier = listDeleteAt(oneUpPropertyIdentifier, listLen(oneUpPropertyIdentifier, '._'), '._') />
                                    <cfset oneUpPropertyName = listLast(oneUpPropertyIdentifier, '.') />
                                    <cfset twoUpEntityName = attributes.hibachiScope.getService("hibachiService").getLastEntityNameInPropertyIdentifier( attributes.smartList.getBaseEntityName(), oneUpPropertyIdentifier ) />
                                    <cfset oneUpPropertyMeta = attributes.hibachiScope.getService("hibachiService").getPropertyByEntityNameAndPropertyName( twoUpEntityName, oneUpPropertyName ) />
                                    <cfif structKeyExists(oneUpPropertyMeta, "fieldtype") && oneUpPropertyMeta.fieldtype eq 'many-to-one' && (!structKeyExists(thisPropertyMeta, "ormtype") || listFindNoCase("boolean,string", thisPropertyMeta.ormtype))>
                                        <cfset column.filter = true />
                                    </cfif>
                                </cfif>
                                --->
                            <cfelseif !isBoolean(column.filter)>
                                <cfset column.filter = false />
                            </cfif>
                            <cfif not len(column.range) && (!structKeyExists(thisPropertyMeta, "persistent") || thisPropertyMeta.persistent) && structKeyExists(thisPropertyMeta, "ormType") && (thisPropertyMeta.ormType eq 'integer' || thisPropertyMeta.ormType eq 'big_decimal' || thisPropertyMeta.ormType eq 'timestamp')>
                                <cfset column.range = true />
                            <cfelseif !isBoolean(column.range)>
                                <cfset column.range = false />
                            </cfif>
                        </cfif>
                    <!--- Otherwise this is a processObject property --->
                    <cfelseif len(column.processObjectProperty)>
                        <cfset column.search = false />
                        <cfset column.sort = false />
                        <cfset column.filter = false />
                        <cfset column.range = false />
        
                        <cfset thistag.allprocessobjectproperties = listAppend(thistag.allprocessobjectproperties, column.processObjectProperty) />
                    </cfif>
                    <cfif findNoCase("primary", column.tdClass) and thistag.expandable>
                        <cfset attributes.tableattributes = listAppend(attributes.tableattributes, 'data-expandsortproperty="#column.propertyIdentifier#"', " ") />
                        <cfset column.sort = false />
                    </cfif>
                </cfloop>
                */
                /*
                <!--- Setup a variable for the number of columns so that the none can have a proper colspan --->
                <cfset thistag.columnCount = arrayLen(thisTag.columns) />
                <cfif thistag.selectable>
                    <cfset thistag.columnCount += 1 />
                </cfif>
                <cfif thistag.multiselectable>
                    <cfset thistag.columnCount += 1 />
                </cfif>
                <cfif thistag.sortable>
                    <cfset thistag.columnCount += 1 />
                </cfif>
                <cfif attributes.administativeCount>
                    <cfset thistag.columnCount += 1 />
                </cfif>
                <cfif attributes.administativeCount>
                </cfif>
                */
            };
            this.getAdminAttributesByType = function (type) {
                var recordActionName = 'record' + type.toUpperCase() + 'Action';
                var recordActionPropertyName = recordActionName + 'Property';
                var recordActionQueryStringName = recordActionName + 'QueryString';
                var recordActionModalName = recordActionName + 'Modal';
                _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-' + type + 'action="' + _this[recordActionName] + '"', " ");
                if (_this[recordActionPropertyName] && _this[recordActionPropertyName].length) {
                    _this.adminattributes = _this.utiltyService.listAppend(_this.adminattribtues, 'data-' + type + 'actionproperty="' + _this[recordActionPropertyName] + '"', " ");
                }
                _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-' + type + 'querystring="' + _this[recordActionQueryStringName] + '"', " ");
                _this.adminattributes = _this.utilityService.listAppend(_this.adminattributes, 'data-' + type + 'modal="' + _this[recordActionModalName] + '"', " ");
            };
            this.getExportAction = function () {
                return _this.exportAction + _this.collectionID;
            };
            this.$slatwall = $slatwall;
            this.partialsPath = partialsPath;
            this.utilityService = utilityService;
            this.$scope = $scope;
            this.$element = $element;
            this.collectionConfigService = collectionConfigService;
            this.paginationService = paginationService;
            //this is performed early to populate columns with swlistingcolumn info
            this.$transclude = $transclude;
            this.$transclude(this.$scope, function () { });
            this.paginator = paginationService.createPagination();
            this.paginator.getCollection = this.getCollection;
            //if collection Value is string instead of an object then create a collection
            if (angular.isString(this.collection)) {
                this.collectionConfig = this.collectionConfigService.newCollectionConfig(this.collection);
                /*
                propertyIdentifier:"@",
                processObjectProperty:"@",
                title:"@",
                tdclass:"@",
                search:"=",
                sort:"=",
                filter:"=",
                range:"=",
                editable:"=",
                buttonGroup:"="
                */
                angular.forEach(this.columns, function (column) {
                    var columnOptions = {};
                    _this.collectionConfig.setDisplayProperties(column.propertyIdentifier, column.title, columnOptions);
                });
                this.collectionConfig.setPageShow(this.paginator.pageShow);
                this.collectionConfig.setCurrentPage(this.paginator.currentPage);
                this.exampleEntity = this.$slatwall.newEntity(this.collection);
            }
            //setup export action
            if (angular.isDefined(this.exportAction)) {
                this.exportAction = "/?slatAction=main.collectionExport&collectionExportID=";
            }
            //Setup table class
            this.tableclass = this.tableclass || '';
            this.tableclass = this.utilityService.listPrepend(this.tableclass, 'table table-bordered table-hover', ' ');
            //Setup Select
            if (this.selectFieldName && this.selectFieldName.length) {
                this.selectable = true;
                this.tableclass = this.utilityService.listAppend(this.tableclass, 'table-select', ' ');
                this.tableattributes = this.utilityService.listAppend(this.tableattributes, 'data-selectfield="' + this.selectFieldName + '"', ' ');
            }
            //Setup MultiSelect
            if (this.multiselectFieldName && this.multiselectFieldName.length) {
                this.multiselectable = true;
                this.tableclass = this.utilityService.listAppend(this.tableclass, 'table-multiselect', ' ');
                this.tableattributes = this.utiltiyService.listAppend(this.tableattributes, 'data-multiselectpropertyidentifier="' + this.multiselectPropertyIdentifier + '"', ' ');
            }
            if (this.multiselectable && !this.columns.length) {
                //check if it has an active flag and if so then add the active flag
                if (this.exampleEntity.metaData.activeProperty) {
                    this.collectionConfig.addFilter('activeFlag', 1);
                }
            }
            //Look for Hierarchy in example entity
            if (!this.parentPropertyName || (this.parentPropertyName && !this.parentProopertyName.length)) {
                console.log('noparent');
                console.log(this.exampleEntity);
                if (this.exampleEntity.metaData.hb_parentPropertyName) {
                    console.log('getparent');
                    this.parentPropertyName = this.exampleEntity.metaData.hb_parentPropertyName;
                }
            }
            //Setup Hierachy Expandable
            if (this.parentPropertyName && this.parentPropertyName.length) {
                this.expandable = true;
                this.tableclass = this.utilityService.listAppend(this.tableclass, 'table-expandable', ' ');
                this.collectionConfig.addFilter(this.parentPropertyName + '.' + this.exampleEntity.$$getIDName(), 'NULL', 'IS');
                this.allpropertyidentifiers = this.utilityService.listAppend(this.allpropertyidentifiers, this.exampleEntity.$$getIDName() + 'Path');
                this.tableattributes = this.utilityService.listAppend(this.tableattributes, 'data-parentidproperty=' + this.parentPropertyname + '.' + this.exampleEntity.$$getIDName(), ' ');
                this.collectionConfig.setAllRecords(true);
            }
            //Setup the list of all property identifiers to be used later 
            angular.forEach(this.columns, function (column) {
                //If this is a standard propertyIdentifier
                if (_this.column.propertyIdentifier) {
                    //Add to the all property identifiers
                    _this.allpropertyIdentifiers = _this.utilityService.listAppend(_this.allpropertyidentifiers, column.propertyIdentifier);
                    //Check to see if we need to setup the dynamic filters, ect
                    if (!_this.column.searchable || !_this.column.sortable || !_this.column.filter || !_this.column.range) {
                    }
                }
            });
            this.getCollection();
        }
        SWListingDisplayController.$inject = ['$scope', '$element', '$transclude', '$slatwall', 'partialsPath', 'utilityService', 'collectionConfigService', 'paginationService'];
        return SWListingDisplayController;
    })();
    slatwalladmin.SWListingDisplayController = SWListingDisplayController;
    var SWListingDisplay = (function () {
        function SWListingDisplay(partialsPath) {
            this.partialsPath = partialsPath;
            this.restrict = 'E';
            this.scope = {};
            this.transclude = true;
            this.bindToController = {
                isRadio: "=",
                //angularLink:true || false
                angularLinks: "=",
                /*required*/
                collection: "=",
                collectionConfig: "=",
                edit: "=",
                /*Optional*/
                title: "@",
                /*Admin Actions*/
                recordEditAction: "@",
                recordEditActionProperty: "@",
                recordEditQueryString: "@",
                recordEditModal: "=",
                recordEditDisabled: "=",
                recordDetailAction: "@",
                recordDetailActionProperty: "@",
                recordDetailQueryString: "@",
                recordDetailModal: "=",
                recordDeleteAction: "@",
                recordDeleteActionProperty: "@",
                recordDeleteQueryString: "@",
                recordProcessAction: "@",
                recordProcessActionProperty: "@",
                recordProcessQueryString: "@",
                recordProcessContext: "@",
                recordProcessEntity: "=",
                recordProcessUpdateTableID: "=",
                recordProcessButtonDisplayFlag: "=",
                /*Hierachy Expandable*/
                parentPropertyName: "@",
                /*Sorting*/
                sortProperty: "@",
                sortContextIDColumn: "@",
                sortContextIDValue: "@",
                /*Single Select*/
                selectFiledName: "@",
                selectValue: "@",
                selectTitle: "@",
                /*Multiselect*/
                multiselectFieldName: "@",
                multiselectPropertyIdentifier: "@",
                multiselectValues: "@",
                /*Helper / Additional / Custom*/
                tableattributes: "@",
                tableclass: "@",
                adminattributes: "@",
                /* Settings */
                showheader: "=",
                /* Basic Action Caller Overrides*/
                createModal: "=",
                createAction: "@",
                createQueryString: "@",
                exportAction: "@"
            };
            this.controller = SWListingDisplayController;
            this.controllerAs = "swListingDisplay";
            this.link = function (scope, element, attrs, controller, transclude) {
            };
            this.partialsPath = partialsPath;
            this.templateUrl = this.partialsPath + 'listingdisplay.html';
        }
        SWListingDisplay.$inject = ['partialsPath'];
        return SWListingDisplay;
    })();
    slatwalladmin.SWListingDisplay = SWListingDisplay;
    angular.module('slatwalladmin').directive('swListingDisplay', ['partialsPath', function (partialsPath) { return new SWListingDisplay(partialsPath); }]);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../../directives/common/swlistingdisplay.js.map