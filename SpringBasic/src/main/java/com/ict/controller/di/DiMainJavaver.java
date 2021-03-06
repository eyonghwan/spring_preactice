package com.ict.controller.di;

import com.ict.controller.di.classfile.Book;
import com.ict.controller.di.classfile.Library;
import com.ict.controller.di.classfile.Singer;
import com.ict.controller.di.classfile.Stage;

public class DiMainJavaver {

	public static void main(String[] args) {
		// 가수, 무대를 생성한 다음
		Singer singer = new Singer();
		
		Stage stage = new Stage(singer);
		
		// 무대의 공연(perform) 메서드를 호출해주세요.
		stage.perform();
		
		singer.sing();
		
		Book book = new Book();
		
		Library library = new Library();
		
		library.setBook(book);
		
		library.browse();

	}

}
