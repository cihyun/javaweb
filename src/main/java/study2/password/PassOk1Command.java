package study2.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PassOk1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("=== 원본 자료 ===");
		System.out.println("mid : "+mid);
		System.out.println("pwd : "+pwd);
		System.out.println("idx : "+idx);
		System.out.println();
		
		if(idx == 1) {
			// 숫자비번 암호화 하는 경우
			//암호화를 위한 키 설정(1234ABCD)
			int key = 0x1234ABCD;
			int encPwd, decPwd;
			
			// 암호화 : (EOR(^) 암호화)
			encPwd = Integer.parseInt(pwd) ^ key;
			
			System.out.println("=== 암호화된 비밀번호 ===");
			System.out.println("encPwd : "+encPwd);
			System.out.println("---------DB에 암호화된 비밀번호 저장 처리-------");
			System.out.println("암호화된 비밀번호를 DB에 저장 시킨 후, 인증을 위해 다시 불러 와서 디코딩 처리");
			
			decPwd = encPwd ^ key;
			System.out.println("=== 복호화된 비밀번호 ===");
			System.out.println("decPwd : "+decPwd);
			System.out.println();
		} else {
			System.out.println("1. 원본 비밀번호 : "+pwd);
			// 숫자/문자 혼합 암호화 하는 경우
			long intPwd;
			String strPwd = "";
			
			for(int i=0; i<pwd.length(); i++ ) {
				intPwd = pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("2. 아스키코드문자로 변환된 비밀번호 : "+strPwd);
			
			intPwd = Long.parseLong(strPwd);
			long encPwd;
			long key = 0x1234ABCD;
			
			encPwd = intPwd ^ key;
			strPwd = String.valueOf(encPwd);
			System.out.println("3. 인코딩된 비밀번호로 DB에 저장시킬 비밀번호가 된다. : "+strPwd);
			System.out.println("======== DB 저장중 ===========");
			
			// DB에 저장된 암호를 다시 불러와서 복호화(디코딩) 시켜준다.
			long decPwd;
			
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("4. 복호화(디코딩)된 비밀번호 : "+decPwd);
			
			// 복원된 비번은 숫자이므로 문자로 변환 후 2자리씩 분리 처리시켜준다.
			strPwd = String.valueOf(decPwd);
			
			char ch;
			String result = "";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println("최종적으로 복호화된 비밀번호 : "+result);
		}

	}

}
