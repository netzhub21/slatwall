<!---

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

--->

<cfparam name="rc.accountPayment" type="any" />
<cfparam name="rc.account" type="any" />
<cfparam name="rc.paymentMethod" type="any" />
<cfparam name="rc.accountPaymentTypeSystemCode" type="string" />
<cfparam name="rc.edit" type="boolean" default="tr" />

<cfsilent>
	<cfset local.amount = rc.account.getTermAccountBalance() />
</cfsilent>

<cfoutput>
	<cf_HibachiEntityDetailForm object="#rc.accountPayment#" edit="#rc.edit#">
		
		<input type="hidden" name="account.accountID" value="#rc.account.getAccountID()#" />
		<input type="hidden" name="paymentMethod.paymentMethodID" value="#rc.paymentMethod.getPaymentMethodID()#" />
		
		<cfif rc.accountPaymentTypeSystemCode eq "aptCharge">
			<input type="hidden" name="accountPaymentType.typeID" value="444df32dd2b0583d59a19f1b77869025" />
		<cfelse>
			<input type="hidden" name="accountPaymentType.typeID" value="444df32e9b448ea196c18c66e1454c46" />
		</cfif>
		
		<!--- Credit Card --->
		<cfif rc.paymentMethod.getPaymentMethodType() eq "creditCard">
			
			<input type="hidden" name="process" value="1" />
			
			<cf_HibachiPropertyRow>
				<cf_HibachiPropertyList>
					<cfif rc.accountPaymentTypeSystemCode eq "aptCharge">
						<cf_HibachiFieldDisplay fieldname="processContext" title="#$.slatwall.rbKey('admin.order.createorderpayment.transactionType')#" fieldtype="select" valueOptions="#[{value='authorizeAndCharge', name=$.slatwall.rbKey('define.authorizeAndCharge')}, {value='authorize', name=$.slatwall.rbKey('define.authorize')}]#" edit="true">
					<cfelse>
						<cf_HibachiFieldDisplay fieldname="processContext" title="#$.slatwall.rbKey('admin.order.createorderpayment.transactionType')#" fieldtype="select" valueOptions="#[{value='credit', name=$.slatwall.rbKey('define.credit')}]#" edit="true">
					</cfif>
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="amount" edit="#rc.edit#" value="#local.amount#" />
				</cf_HibachiPropertyList>
			</cf_HibachiPropertyRow>
			
			<cf_HibachiPropertyRow>
				<cf_HibachiPropertyList divClass="span6">
					<cf_SlatwallAddressDisplay address="#$.slatwall.getService("addressService").newAddress()#" fieldnameprefix="billingAddress." edit="#rc.edit#" />
				</cf_HibachiPropertyList>
				<cf_HibachiPropertyList divClass="span6">
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="nameOnCreditCard" edit="#rc.edit#" />
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="creditCardNumber" edit="#rc.edit#" />
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="expirationMonth" edit="#rc.edit#" />
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="expirationYear" edit="#rc.edit#" />
					<cf_HibachiPropertyDisplay object="#rc.accountPayment#" property="securityCode" edit="#rc.edit#" />
				</cf_HibachiPropertyList>
			</cf_HibachiPropertyRow>
			
		<!--- Check --->
		<cfelseif rc.paymentMethod.getPaymentMethodType() eq "check">
			<cf_HibachiPropertyDisplay object="#rc.orderPayment#" property="amount" edit="#rc.edit#" value="#local.amount#" />
		<!--- Cash --->
		<cfelseif rc.paymentMethod.getPaymentMethodType() eq "cash">	
			<cf_HibachiPropertyDisplay object="#rc.orderPayment#" property="amount" edit="#rc.edit#" value="#local.amount#" />
		<!--- ??? --->
		<cfelse>
			<cf_HibachiPropertyDisplay object="#rc.orderPayment#" property="amount" edit="#rc.edit#" value="#local.amount#" />	
		</cfif>
		
	</cf_HibachiEntityDetailForm>
</cfoutput>