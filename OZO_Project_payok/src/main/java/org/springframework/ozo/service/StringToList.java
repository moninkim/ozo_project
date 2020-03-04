package org.springframework.ozo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class StringToList {
	
	public static List<String> makeList(String str){
		
	    List<String> values = new ArrayList<String>(); 
	    StringTokenizer itr = new StringTokenizer(str.toString(), "|");
	    while (itr.hasMoreTokens()){
	    	values.add(itr.nextToken().trim());
	    }
	    
	    return values;
	
	}

}
