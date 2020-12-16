package com.wv.root.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {
	
	public void before(JoinPoint join) {
		//logger: 출력할 메시지를 Appender에 전달
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); //대상객체
		logger.info("----------Aop Start-----------");
		
		Object[] args = join.getArgs(); //대상파라미터
		if(args != null) {
			logger.info("method: "+ join.getSignature().getName());
			for(int i=0; i<args.length; i++) {
				logger.info(i+"번째: "+ args[i]);
			}
		}
	}
	
	public void after(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("---------Aop End---------");
	}
	
	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+"");
		logger.info("-------------Error Log--------------");
		logger.info("Error: "+join.getArgs());
		logger.info("Error: "+join.toString());
	}
	
	
	
	
	

}
