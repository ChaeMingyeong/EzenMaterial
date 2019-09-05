package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyProAction implements Action{

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
        String board_file = multi.getOriginalFileName("board_file"); //파일이름꺼낼때
	    int board_num = Integer.parseInt(multi.getParameter("board_num"));
        boardBean = new BoardBean();
		boardBean.setBoard_name(board_name);
		boardBean.setBoard_pass(board_pass);
		boardBean.setBoard_subject(board_subject);
		boardBean.setBoard_content(board_content);
		boardBean.setBoard_file(board_file);
		boardBean.setBoard_num(board_num);
		int pg = Integer.parseInt(multi.getParameter("pg"));
	
		
		BoardDAO boardDao = new BoardDAO();
		int chkModi = boardDao.modiBoard(boardBean);

		//데이터 공유
		//request.setAttribute("chkModi", chkModi);
		//다음단계화면이 없고 boardview로 갈거기 때문에 데이터 공유없이 바로 처리 
		if(chkModi ==0) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = "boardDetail.do?board_num=" + board_num + "&pg=" +pg;
		}
		
		//request.setAttribute("pg", pg);
		//view 처리 파일 선택
		return forward;
	}

}
