package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardWriteProAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터 처리
		String forward= null;
		BoardBean boardBean = null;
		String realFolder = "";
		String saveFolder ="/boardUpload";
		int fileSize = 5*1024*1024;
		
		realFolder = request.getServletContext().getRealPath(saveFolder);
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());


		String board_name = multi.getParameter("board_name");
		String board_pass = multi.getParameter("board_pass");
		String board_subject = multi.getParameter("board_subject");
		String board_content = multi.getParameter("board_content");
        String board_file = multi.getOriginalFileName("board_file");
		boardBean = new BoardBean();
		boardBean.setBoard_name(board_name);
		boardBean.setBoard_pass(board_pass);
		boardBean.setBoard_subject(board_subject);
		boardBean.setBoard_content(board_content);
		boardBean.setBoard_file(board_file);
		
		BoardDAO boadDao = new BoardDAO();
		int su = boadDao.insertBoard(boardBean);
            
		request.setAttribute("su", su);
		if(su ==0) {
		  response.setContentType("text/html; charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.println("<script>");
		  out.println("alert('등록실패');");
		  out.println("history.back();");
		  out.println("</script>");
		}else {
			forward = "boardList.do";
		}
		//공유 데이터 처리 jsp 파일 선택(반드시, jsp 일 필요는없음)
		return forward;
	}
}
