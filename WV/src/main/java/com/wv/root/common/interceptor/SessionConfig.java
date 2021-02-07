package com.wv.root.common.interceptor;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionConfig implements HttpSessionListener {
	
	private static final Map<String,String> mses = new ConcurrentHashMap<>();
	
	public SessionConfig() {
		super();
	}

	public static Boolean getOnlineTM(String getId, String mid) {
		int c = 0;
		for(String key : mses.keySet()) { //키셋을 돌리면서 
			if(key.equals(getId)) {
				c++;
			}
		}
		if(c>0) {
			return true;
		}
		return false;
	}
	public static void setOnlineTM(String getId, String mid) {
		for(String key : mses.keySet()) {
			if(key.equals(getId)) {
				mses.put(key, mid);
			}
		}
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("***************** se:  "+se);
		HttpSession session = se.getSession();
		System.out.println("*****************이벤트리스너 테스트 생성시 se.getSession():  "+session);
		System.out.println("***************** getId:  "+session.getId());
		mses.put(se.getSession().getId(), "beforelogin"); //<<-value에 로긴후 자신의 member_id를 업데이트해줘야함
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("***************** se:  "+se);
		HttpSession session = se.getSession();
		System.out.println("*****************이벤트리스너 테스트 소멸시 se.getSession():  "+session);
		System.out.println("***************** getId:  "+session.getId());
		if(se.getSession().getId()!=null) {
//			mses.get(se.getSession().getId()).invalidate();
			mses.remove(se.getSession().getId());
		}
		
	}
	
	

}
