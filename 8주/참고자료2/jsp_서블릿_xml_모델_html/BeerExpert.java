package com.example.model;
import java.util.*;

public class BeerExpert {
	public List getBrands(String color) {
		List brands = new ArrayList();
		if(color.equals("amber")) {
			brands.add("Jack");
			brands.add(“Red");
		}
		else {
			brands.add("Jail");
			brands.add(“Gout");
		}
		return(brands);
	}
}
	
