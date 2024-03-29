package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/payment-discount>
**/
@:require(js, hxelectron) typedef PaymentDiscount = {
	/**
		A string used to uniquely identify a discount offer for a product.
	**/
	var identifier : String;
	/**
		A string that identifies the key used to generate the signature.
	**/
	var keyIdentifier : String;
	/**
		A universally unique ID (UUID) value that you define.
	**/
	var nonce : String;
	/**
		A UTF-8 string representing the properties of a specific discount offer, cryptographically signed.
	**/
	var signature : String;
	/**
		The date and time of the signature's creation in milliseconds, formatted in Unix epoch time.
	**/
	var timestamp : Float;
}