{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.1                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2011                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{if $form.credit_card_number or $form.bank_account_number}
    <div id="payment_information">
        <fieldset class="billing_mode-group {if $paymentProcessor.payment_type & 2}direct_debit_info-group{else}credit_card_info-group{/if}">
            <legend>
               {if $paymentProcessor.payment_type & 2}
                    {ts}Direct Debit Information{/ts}
               {else}
                   {ts}Credit Card Information{/ts}
               {/if}
            </legend> 
            {if $paymentProcessor.billing_mode & 2 and !$hidePayPalExpress }
            <div class="crm-section no-label paypal_button_info-section">	
			    <div class="content description">
			        {ts}If you have a PayPal account, you can click the PayPal button to continue. Otherwise, fill in the credit card and billing information on this form and click <strong>Continue</strong> at the bottom of the page.{/ts}
				</div>
			</div>
			 <div class="crm-section no-label {$form.$expressButtonName.name}-section">	
			    <div class="content description">
			        {$form.$expressButtonName.html}
			        <div class="description">Save time. Checkout securely. Pay without sharing your financial information. </div>
				</div>
			</div>
            {/if} 

            {if $paymentProcessor.billing_mode & 1}
                <div class="crm-section billing_mode-section {if $paymentProcessor.payment_type & 2}direct_debit_info-section{else}credit_card_info-section{/if}">
                   {if $paymentProcessor.payment_type & 2}
                        <div class="crm-section {$form.account_holder.name}-section">	
							<div class="label">{$form.account_holder.label}</div>
                            <div class="content">{$form.account_holder.html}</div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section {$form.bank_account_number.name}-section">	
							<div class="label">{$form.bank_account_number.label}</div>
                            <div class="content">{$form.bank_account_number.html}</div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section {$form.bank_identification_number.name}-section">	
							<div class="label">{$form.bank_identification_number.label}</div>
                            <div class="content">{$form.bank_identification_number.html}</div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section {$form.bank_name.name}-section">	
							<div class="label">{$form.bank_name.label}</div>
                            <div class="content">{$form.bank_name.html}</div>
                            <div class="clear"></div> 
                        </div>
                   {else}
                		<div class="crm-section {$form.credit_card_type.name}-section">	
							<div class="label">{$form.credit_card_type.label}</div>
                			<div class="content">{$form.credit_card_type.html}</div>
                			<div class="clear"></div> 
                		</div>
                		<div class="crm-section {$form.credit_card_number.name}-section">	
							<div class="label">{$form.credit_card_number.label}</div>
                			<div class="content">{$form.credit_card_number.html}
                				<div class="description">{ts}Enter numbers only, no spaces or dashes.{/ts}</div>
                			</div>
                			<div class="clear"></div> 
                		</div>
                		<div class="crm-section {$form.cvv2.name}-section">	
							<div class="label">{$form.cvv2.label}</div>
                			<div class="content">
                				{$form.cvv2.html}
                				<img src="{$config->resourceBase}i/mini_cvv2.gif" alt="{ts}Security Code Location on Credit Card{/ts}" style="vertical-align: text-bottom;" />
                				<div class="description">{ts}Usually the last 3-4 digits in the signature area on the back of the card.{/ts}</div>
                			</div>
                			<div class="clear"></div> 
                		</div>
                		<div class="crm-section {$form.credit_card_exp_date.name}-section">	
							<div class="label">{$form.credit_card_exp_date.label}</div>
                			<div class="content">{$form.credit_card_exp_date.html}</div>
                			<div class="clear"></div> 
                		</div>
                    {/if}
                </div>
                </fieldset>

                <fieldset class="billing_name_address-group">
                	<legend>{ts}Billing Name and Address{/ts}</legend>
                	  {if $profileAddressFields}
                        <input type="checkbox" id="billingcheckbox" value=0> {ts}Billing Address is same as above{/ts}
                      {/if}
                    <div class="crm-section billing_name_address-section">
                        <div class="crm-section billingNameInfo-section">	
                        	<div class="content description">
                        	  {if $paymentProcessor.payment_type & 2}
                        	     {ts}Enter the name of the account holder, and the corresponding billing address.{/ts}
                        	  {else}
                        	     {ts}Enter the name as shown on your credit or debit card, and the billing address for this card.{/ts}
                        	  {/if}
                        	</div>
                        </div>
                        <div class="crm-section {$form.billing_first_name.name}-section">	
							<div class="label">{$form.billing_first_name.label}</div>
                            <div class="content">{$form.billing_first_name.html}</div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section {$form.billing_middle_name.name}-section">	
							<div class="label">{$form.billing_middle_name.label}</div>
                            <div class="content">{$form.billing_middle_name.html}</div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section {$form.billing_last_name.name}-section">	
							<div class="label">{$form.billing_last_name.label}</div>
                            <div class="content">{$form.billing_last_name.html}</div>
                            <div class="clear"></div> 
                        </div>
                        {assign var=n value=billing_street_address-$bltID}
                        <div class="crm-section {$form.$n.name}-section">	
							<div class="label">{$form.$n.label}</div>
                            <div class="content">{$form.$n.html}</div>
                            <div class="clear"></div> 
                        </div>
                        {assign var=n value=billing_city-$bltID}
                        <div class="crm-section {$form.$n.name}-section">	
							<div class="label">{$form.$n.label}</div>
                            <div class="content">{$form.$n.html}</div>
                            <div class="clear"></div> 
                        </div>
                        {assign var=n value=billing_country_id-$bltID}
                        <div class="crm-section {$form.$n.name}-section">	
							<div class="label">{$form.$n.label}</div>
                            <div class="content">{$form.$n.html|crmReplace:class:big}</div>
                            <div class="clear"></div> 
                        </div>
                        {assign var=n value=billing_state_province_id-$bltID}
                        <div class="crm-section {$form.$n.name}-section">	
							<div class="label">{$form.$n.label}</div>
                            <div class="content">{$form.$n.html|crmReplace:class:big}</div>
                            <div class="clear"></div> 
                        </div>
                        {assign var=n value=billing_postal_code-$bltID}
                        <div class="crm-section {$form.$n.name}-section">	
							<div class="label">{$form.$n.label}</div>
                            <div class="content">{$form.$n.html}</div>
                            <div class="clear"></div> 
                        </div>
                    </div>
                </fieldset>
            {else}
                </fieldset>
            {/if}
    </div>
     {if $profileAddressFields}
     <script type="text/javascript">
    {literal}                                                                                                                                                                                                                                 
cj( function( ) {                                                                                                                                                                                                                         
    cj('#billingcheckbox').click( function( ) {
                                                                                                                                                                                         
          sameAddress( this.checked ); // need to only action when check not when toggled, can't assume desired behaviour
                                                                                                                                                                                                
        });                                                                                                                                                                                                                               
    });                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                         
function sameAddress( setValue ) { 
  {/literal} 
    var  addressFields = {$profileAddressFields|@json_encode};
    {literal}
    var locationTypeInProfile = 'Primary';                                                                                                                                                                                                       
    var orgID = field = fieldName = null;   
    if ( setValue ) {                                                                                                                                                                                          
    cj('.billing_name_address-section input').each( function( i ){                                                                                                                                                                       
            orgID = cj(this).attr('id');
            field = orgID.split('-');                                                                                                                                                                                                     
            fieldName = field[0].replace('billing_', '');                                                                                                                                                             
            if ( field[1] ) { // ie. there is something after the '-' like billing_street_address-5   
                              // this means it is an address field                                                                                                                                                                                                         
              if(addressFields[fieldName]){             
                fieldName =  fieldName + '-' + addressFields[fieldName]; 
              }                                                                                                                                                                                   
                                                                                                                                                                         
            }  
                                                                                                                                                                                                                                                                                                                                                                                                                                             
              cj(this).val( cj('#' + fieldName ).val() );                                                                                                                                                                                                                                                                                                                                                                                                              
            });
    cj('.billing_name_address-section select').each( function( i ){                                                                                                                                                                       
        orgID = cj(this).attr('id');
        field = orgID.split('-');                                                                                                                                                                                                     
        fieldName = field[0].replace('billing_', ''); 
        fieldNameBase = fieldName.replace('_id', '');                                                                                                                                                            
        if ( field[1] ) { // ie. there is something after the '-' like billing_street_address-5   
                          // this means it is an address field                                                                                                                                                                                                         
          if(addressFields[fieldNameBase]){
            fieldName =  fieldNameBase + '-' + addressFields[fieldNameBase]; 
          }                                                                                                                                                                                   
                                                                                                                                                                     
        }  
                                                                                                                                                                                                                                                                                                                                                                                                                                         
          cj(this).val( cj('#' + fieldName ).val() );                                                                                                                                                                                                                                                                                                                                                                                                              
        });
      }                                                                                                                                                                                                                           
}                                                                                                                                                                                                                                         
{/literal} 
</script>
{/if}
{else}
    {if $paymentProcessor.payment_processor_type == 'Stripe'}
        {literal}
        <style>
        #crm-container .stripe-payment-information .crm-section .label, .stripe-payment-information .crm-section .label {
            width: 100px;
            margin-right: 10px;
        }
        .stripe-payment-information .stripe-left {
            float: left;
            width: 49%;
            margin-right: 1%;
        }
        .stripe-payment-information .stripe-right {
            float: left;
            width: 49%;
            margin-left: 1%;
        }
        .stripe-payment-information .stripe-error {
            color: #ff0000;
        }
        </style>
        {/literal}
        <div id="payment_information" class="stripe-payment-information">
            <fieldset class="billing_mode-group credit_card_info-group">
                <legend>{ts}Credit Card Information{/ts}</legend> 
                <div class="stripe-error"></div>
                <div class="crm-section billing_mode-section credit_card_info-section">
                    <div class="stripe-left">
                        <div class="crm-section billing_first_name-section">	
                            <div class="label">First Name</div>
                            <div class="content"><input type="text" id="billing-first-name" class="billing-first-name"/></div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section billing_last_name-section">	
                            <div class="label">Last Name</div>
                            <div class="content"><input type="text" id="billing-last-name" class="billing-last-name"/></div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section billing_street_address-section">	
                            <div class="label">Street Address</div>
                            <div class="content"><input type="text" id="billing-address" class="billing-address"/></div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section billing_postal_code-section">	
                            <div class="label">Postal Code</div>
                            <div class="content"><input type="text" id="billing-postal-code" class="billing-postal-code"/></div>
                            <div class="clear"></div> 
                        </div>
                    </div>

                    <div class="stripe-right">
                        <div class="crm-section credit-card-number-section">	
                            <div class="label">Card Number</div>
                            <div class="content"><input type="text" size="20" autocomplete="off" class="card-number"/></div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section cvv2-section">	
                            <div class="label">Security Code</div>
                            <div class="content">
                                <input type="text" size="4" autocomplete="off" class="card-cvc"/>
                                <img src="{$config->resourceBase}i/mini_cvv2.gif" alt="{ts}Security Code Location on Credit Card{/ts}" style="vertical-align: middle;" />
                            </div>
                            <div class="clear"></div> 
                        </div>
                        <div class="crm-section credit_card_exp_date-section">	
                            <div class="label">Expiration Date</div>
                            <div class="content">
                            <select class="form-date" id="credit_card_exp_month">
                                <option value="1">Jan</option>
                                <option value="2">Feb</option>
                                <option value="3">Mar</option>
                                <option value="4">Apr</option>
                                <option value="5">May</option>
                                <option value="6">Jun</option>
                                <option value="7">Jul</option>
                                <option value="8">Aug</option>
                                <option value="9">Sep</option>
                                <option value="10">Oct</option>
                                <option value="11">Nov</option>
                                <option value="12">Dec</option>
                            </select>&nbsp;<select class="form-date" id="credit_card_exp_year">
                            </select> 
                            <div class="clear"></div> 
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <script>
        {literal}
        cj(function(){
            // add expiration years
            var year = new Date().getFullYear();
            for(var i=0; i<10; i++) {
                cj('#credit_card_exp_year').append('<option value="'+year+'">'+year+'</option>');
                year++;
            }

            // stripe variables
            {/literal}
            var stripe_url = '{$paymentProcessor.url_site}';
            var stripe_publishable_key = '{$paymentProcessor.user_name}';
            {literal}

            // load stripe js, and set the publishable key
            cj.getScript(stripe_url, function(){
                Stripe.setPublishableKey(stripe_publishable_key);
            });

            // intercept form submission
            cj('form#Main').submit(function(){
                // prevent double submits
                cj('form#main .form-submit').attr("disabled", "disabled");

                Stripe.createToken({
                    number: cj('.card-number').val(),
                    cvc: cj('.card-cvc').val(),
                    exp_month: cj('#credit_card_exp_month').val(),
                    exp_year: cj('#credit_card_exp_year').val()
                }, function(status, response){
                    if(response.error) {
                        cj('.stripe-error').html(response.error.message);
                        // re-enable the form
                        cj('.submit-button').removeAttr("disabled");
                    } else {
                        // add stripe token and submit the form
                        var token = response['id'];
                        cj("form#Main")
                            .append("<input type='hidden' name='stripeToken' value='"+token+"'/>")
                            .get(0).submit();
                    }
                });

                // prevent the form from submitting with the default action
                return false;
            });
        });
        {/literal}
        </script>
    {/if}
{/if}
