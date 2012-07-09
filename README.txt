Stripe Payment Processor for CiviCRM
====================================

Note: This is in development and doesn't work yet

Installation instructions:

1. Set up a custom extensions and a custom templates directory in CiviCRM by go
   to the Upload Directories settings page (civicrm/admin/extensions?reset=1).

2. Put this payment processor folder (org.eff.payment.stripe) in your custom
   extensions directory.

3. This payment processor requires custom templates to display correctly. Copy
   or symlink the templates in the custom_templates folder included with this
   extension to your custom templates folder.

4. Enable the Stripe payment processor in the CiviCRM Extensions page
   (civicrm/admin/extensions?reset=1).

5. Add a new Stripe payment processor in the Payment Processors settings page
   (civicrm/admin/paymentProcessor?reset=1).


