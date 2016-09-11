package com.xpsurgery.cornershop.warehouseActions;

public class UnknownProductException extends RuntimeException {

	public UnknownProductException(String sku) {
		super("SKU code " + sku + " is not in the product catalogue.");
	}

}
