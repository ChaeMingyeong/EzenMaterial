/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.40
 * Generated at: 2019-08-27 03:07:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.File;
import org.json.JSONObject;
import member2.dao.MemberDAO;
import member2.bean.MemberDTO;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

public final class member_005finsert_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("org.json.JSONObject");
    _jspx_imports_classes.add("com.oreilly.servlet.multipart.DefaultFileRenamePolicy");
    _jspx_imports_classes.add("member2.bean.MemberDTO");
    _jspx_imports_classes.add("java.io.File");
    _jspx_imports_classes.add("com.oreilly.servlet.MultipartRequest");
    _jspx_imports_classes.add("member2.dao.MemberDAO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("UTF-8"); //post방식일때, 한글처리 
 //실제 폴더 위치
 String dir = request.getServletContext().getRealPath("/storage");  //--> 이 폴더랑 똑같은 이름의 폴더를 [WebContent] -[storage폴더]에 만듬
 //요청처리객체(request가 아닌, cos.jar에 있는 multipart 객체를 사용하게 됨)
 //요청정보,저장할폴더경로,처리할최대파일크기,엔코딩설정,(+파일이름중복허용) ..디폴트는 똑같은 파일을 불러오면 불러온파일이름으로 저장됨,이때는중복허용안함
 MultipartRequest multi = new MultipartRequest(request, dir, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()); //파일을 이때 dir 폴더에 저장
 
 String phone = multi.getParameter("phone");
 String name = multi.getParameter("name");
 String req_fileName = multi.getParameter("req_fileName");
 String addr = multi.getParameter("addr");
 String logtime = multi.getParameter("logtime");   
 String email = multi.getParameter("email");
 
//DB
 MemberDTO memberDTO = new MemberDTO();
 memberDTO.setPhone(phone);
 memberDTO.setName(name);
 //memberDTO.setFileURL(fileURL);
 memberDTO.setAddr(addr);
 memberDTO.setLogtime(logtime);
 memberDTO.setEmail(email);

 String orginname = multi.getOriginalFileName("req_fileName"); 
 String filename = multi.getFilesystemName("req_fileName");
 int lastIndex = orginname.lastIndexOf(".");
 String filetype = orginname.substring(lastIndex + 1);
 File file = multi.getFile("req_fileName");
 
 int filesize =0;
 if(file!=null) filesize = (int) file.length();
 //DTO에 저장
 memberDTO.setDir(dir);
 memberDTO.setOrginname(orginname);
 memberDTO.setFilename(filename);
 memberDTO.setFiletype(filetype);
 memberDTO.setFilesize(filesize);
 System.out.println(memberDTO.getFilename() + "  --------------------");
 
 MemberDAO memberDAO = new MemberDAO();
 int result = memberDAO.memberWrite(memberDTO);
 
 String rt = null;
 if(result >0){
	   rt = "OK";
 }else{
	   rt = "FAIL";
 }
 
 
 //JSON 객체 생성
 JSONObject json = new JSONObject(); // { } : 객체 생성 직후에는  텅 빈 { }만 만들어진 것임 
 json.put("rt", rt); // { "rt" : "OK" } 또는 { "rt" : "FAIL" }
 out.println(json);
 
 System.out.println(json);

      out.write('\r');
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
