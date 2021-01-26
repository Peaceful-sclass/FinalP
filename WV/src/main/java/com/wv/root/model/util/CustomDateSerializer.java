package com.wv.root.model.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

public class CustomDateSerializer extends JsonSerializer<Date> {
	//date속성의 getter에 @을 붙여 포맷변환하여  view로 전달하는 클래스
	@Override
	public void serialize(Date value, JsonGenerator gen, SerializerProvider arg2) throws 
	IOException, JsonProcessingException {      
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String formattedDate = formatter.format(value);
		
		gen.writeString(formattedDate);
	}
	
}
