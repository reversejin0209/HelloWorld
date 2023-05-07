package com.lec.helloworld.vo;

import java.sql.Date;
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
    private Date arvrdate;
    private String arvcontent;
    private int arvrating;
    private int arvhit;
    private String arvip;
    private int atcode;
    private String mid;
    
    //search
    
    private String schItem;
    
    //paging
    
    private int startRow;
    private int endRow;
}
