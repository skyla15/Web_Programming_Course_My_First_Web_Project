package com.example.model;
import java.util.*;

public class BeerExpert {
	public ArrayList getBrands(String color) { 
		ArrayList brands = new ArrayList(); //ArrayList 객체생성, 리퀘스트와의 파라미터를 비교하여 
 						   
		if(color.equals("amber")){
			brands.add("jack");
			brands.add("red");
		}
		else {
			brands.add("jail");
			brands.add("gout");
		}
		return(brands); //결과값을 서블릿에 넘겨줍니다.
	}
}