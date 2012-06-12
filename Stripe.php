<?php

require_once 'CRM/Core/Payment.php';

class org_eff_payment_stripe extends CRM_Core_Payment {

    static private $_singleton = null;
    static protected $_mode = null;
    static protected $_params = array();

    /**
    * Constructor
    *
    * @param string $mode the mode of operation: live or test
    *
    * @return void
    */
    function __construct( $mode, &$paymentProcessor ) {
        $this->_mode             = $mode;
        $this->_paymentProcessor = $paymentProcessor;
        $this->_processorName    = ts('Stripe');
    }

    /**
    * singleton function used to manage this object
    *
    * @param string $mode the mode of operation: live or test
    *
    * @return object
    * @static
    *
    */
    static function &singleton( $mode, &$paymentProcessor ) {
        $processorName = $paymentProcessor['name'];
        if (self::$_singleton[$processorName] === null ) {
            self::$_singleton[$processorName] = new org_eff_payment_stripe($mode, $paymentProcessor);
        }
        return self::$_singleton[$processorName];
    }

    /**
    * This function checks to see if we have the right config values
    *
    * @return string the error message if any
    * @public
    */
    function checkConfig( ) {
        $config = CRM_Core_Config::singleton();

        $error = array();

        if(empty($this->_paymentProcessor['user_name'])) {
            $error[] = ts('The Publishable Key is not set in the Administer CiviCRM Payment Processor.');
        }
        if(empty($this->_paymentProcessor['password'])) {
            $error[] = ts('The Secret Key is not set in the Administer CiviCRM Payment Processor.');
        }

        if(!empty($error)) {
            return implode('<p>', $error);
        } else {
            return NULL;
        }
    }

    function doDirectPayment(&$params) {
        CRM_Core_Error::fatal(ts('This function is not implemented'));
    }
    
    function doRecurPayment(&$params) {
        CRM_Core_Error::fatal(ts('This function is not implemented'));
    }
}
