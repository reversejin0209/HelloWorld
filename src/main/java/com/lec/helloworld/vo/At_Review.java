package com.lec.helloworld.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class At_Review {
	
	// At_Review
	
    private int arvnum;
    private Timestamp arvrdate;
    private String arvcontent;
    private int arvrating;
    private int arvhit;
    private int atcode;
    private String mid;
    
    //paging
    
    private int startRow;
    private int endRow;
}
