package com.ict.mapper;

import org.apache.ibatis.annotations.Insert;

public interface Sample2Mapper {
	
	@Insert("insert into tbl_test1 (col2) values (#{data})")
	public int insertCol2(String data);
	
}
