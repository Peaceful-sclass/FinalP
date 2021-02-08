package com.wv.root.common.interceptor;

import java.util.ArrayList;
import java.util.List;
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
//	private static final List tmp1 = new ArrayList();

	public static Boolean getOnlineTM(String getId, String mid) {
		Map<String,String> currcon = new ConcurrentHashMap<>();
		System.out.println("[SC:getOnlineTM] params: "+getId+"  "+mid);
		int c = 0;
		for(String key : mses.keySet()) { //키셋을 돌리면서 
			//System.out.println("반복하는 중인 키들: "+key);
			//System.out.println("[SC:getOnlineTM] mses.get(key): "+mses.get(key));
			if(mses.get(key).equals(mid)) {
				currcon.put(key, mses.get(key));   //mses.get(key):mid가 현재접속해 있다면 currcon에 임시로 저장
			}
		}
		
		for(String key : currcon.keySet()) {//currcon에 값없으면 null뜰거 같은데...테스트해보자 : 안뜬다 값이 최소 하나이상임.
			if(currcon.get(key).equals(mid)) {
				c++;
			}
		}
		
		
	/////////
//		for(String key : mses.keySet()) { //키셋을 돌리면서 
//			//System.out.println("반복하는 중인 키들: "+key);
//			//System.out.println("[SC:getOnlineTM] mses.get(key): "+mses.get(key));
//			if(key.equals(getId) && mses.get(key).equals(mid)) {
//				System.out.println("맵의 키와 getId와 같은 키: "+key);
//				c++;
//			}
//		}

		
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
