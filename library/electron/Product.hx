package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/product>
**/
@:require(js, hxelectron) typedef Product = {
	/**
		The string that identifies the product to the Apple App Store.
	**/
	var productIdentifier : String;
	/**
		A description of the product.
	**/
	var localizedDescription : String;
	/**
		The name of the product.
	**/
	var localizedTitle : String;
	/**
		The cost of the product in the local currency.
	**/
	var price : Float;
	/**
		The locale formatted price of the product.
	**/
	var formattedPrice : String;
	/**
		3 character code presenting a product's currency based on the ISO 4217 standard.
	**/
	var currencyCode : String;
	/**
		The object containing introductory price information for the product. available for the product.
	**/
	var introductoryPrice : ProductDiscount;
	/**
		An array of discount offers
	**/
	var discounts : Array<ProductDiscount>;
	/**
		The identifier of the subscription group to which the subscription belongs.
	**/
	var subscriptionGroupIdentifier : String;
	/**
		The period details for products that are subscriptions.
	**/
	var subscriptionPeriod : ProductSubscriptionPeriod;
	/**
		A boolean value that indicates whether the App Store has downloadable content for this product. `true` if at least one file has been associated with the product.
	**/
	var isDownloadable : Bool;
	/**
		A string that identifies the version of the content.
	**/
	var downloadContentVersion : String;
	/**
		The total size of the content, in bytes.
	**/
	var downloadContentLengths : Array<Float>;
}