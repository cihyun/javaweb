package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		/* 파일 압축에 필요한 객체들 선언 준비 */
		// 1. 파일을 읽기 위한 객체 생성
		FileInputStream fis = null;
		
		// 2. 파일을 쓰기 위한 객체 생성
		FileOutputStream fos = null;
		
		// 3. 파일을 압축하기 위한 객체 생성
		ZipOutputStream zos = null;
		
		// 4. 서블릿 출력 스트림 객체
		ServletOutputStream sos = null;
		
		// 5. 파일의 경로와 이름 설정
		// realPath 변수에는 웹 애플리케이션 내에서 실제 파일이 저장되는 경로
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		// zipPath 변수에는 압축 파일이 임시로 생성될 경로를 가져옵니다.
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp/");
		// 변수에는 압축 파일의 이름을 설정합니다. 여기서는 vo.getTitle()로부터 파일 제목을 가져옵니다
		String zipName = vo.getTitle()+ ".zip";
		
		// zipPath와 zipName을 합쳐서 압축 파일의 경로와 이름을 설정합니다. FileOutputStream을 사용하여 압축 파일을 생성하기 위한 출력 스트림을 엽니다. fos 변수에 할당됩니다.
		fos = new FileOutputStream(zipPath + zipName);

		// ZipOutputStream을 생성하여 압축 파일에 데이터를 쓰기 위한 객체를 초기화합니다. fos를 기반으로한 zos 변수에 할당됩니다.
		zos = new ZipOutputStream(fos);

		// 압축에 사용할 데이터 버퍼를 생성합니다. 여기서는 2048바이트 크기의 바이트 배열 b를 생성합니다.
		byte[] b = new byte[2048];
		// 데이터의 길이를 저장할 변수 data를 초기화합니다.
		int data = 0;
		
		// 파일 이름들의 수만큼 반복하는 루프입니다.
		for(int i=0; i<fNames.length; i++) {
			// 압축할 파일의 실제 경로와 저장된 파일 이름을 사용하여 File 객체를 생성합니다.
			File file = new File(realPath + fSNames[i]);
			// FileInputStream을 생성하여 압축할 파일을 읽기 위한 입력 스트림을 엽니다. file을 기반으로한 fis 변수에 할당됩니다.
			fis = new FileInputStream(file);
			// ZipEntry를 생성하여 압축 파일에 새로운 엔트리(파일)를 추가합니다. fNames[i]는 엔트리(파일)의 이름을 설정합니다.
			zos.putNextEntry(new ZipEntry(fNames[i]));
			
			// fis에서 데이터를 읽어서 b 배열에 저장하고, data 변수에는 실제로 읽은 데이터의 길이가 저장됩니다. 읽은 데이터가 없을 때까지 반복하여 데이터를 읽고 압축 파일에 기록합니다.
			while((data = fis.read(b,0,b.length)) != -1) {
				
				// zos에 b 배열의 0부터 data 길이까지의 데이터를 기록합니다. 이를 통해 파일 데이터를 압축 파일에 작성합니다.
				zos.write(b,0,data);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		// 서버에서 압축 작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 존재하는 압축파일을 삭제한다.
		/* 프로토콜형식에 맞도록 헤더에 정보를 제공해 준다. */
		// mimeType : 파일형식(예:텍스트파일?  바이너리파일?... 등등...) --> 파일전송시는 자바에서는 2진 바이너리형식으로 전송처리한다.
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리형식
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약 인터넷익스플로러(IE)에서는 인코딩방식을 'euc-kr'로, 나머지는 'utf-8'로 전송처리한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// Java에 의해서 실제로 파일을 다운(업)로드 처리시켜준다.(FileInputStream/FileOutputStream/ServletOutputStream)
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		// 전송할 객체를 생성한후에는 실제로 파일을 객체에 Byte단위로 담아서 처리시켜준다.
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지가 다운로드가 완료된다. 이후 사용된 객체를 모두 반납한다.
		
		sos.close();
		fis.close();
		// 여기까지가 클라이언트로 전송완료
		
		// 서버에 존재하는 zip파일을 삭제 처리 한다.
		new File(zipPath + zipName).delete();
		
	}
}
