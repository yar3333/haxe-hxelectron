package electron;

/**
	

	See: <https://electronjs.org/docs/api/structures/post-body>
**/
@:require(js, hxelectron) typedef PostBody = {
	/**
		The post data to be sent to the new window.
	**/
	var data : Dynamic;
	/**
		The `content-type` header used for the data. One of `application/x-www-form-urlencoded` or `multipart/form-data`. Corresponds to the `enctype` attribute of the submitted HTML form.
	**/
	var contentType : String;
	/**
		The boundary used to separate multiple parts of the message. Only valid when `contentType` is `multipart/form-data`.
	**/
	var boundary : String;
}