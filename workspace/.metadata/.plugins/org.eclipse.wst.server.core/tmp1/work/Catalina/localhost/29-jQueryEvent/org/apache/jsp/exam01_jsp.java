/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.40
 * Generated at: 2019-08-08 09:15:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class exam01_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("* {\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tcolor: #333;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("\tpadding: 20px 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*form 영역의 크기 및 테두리 */\r\n");
      out.write("#login fieldset {\r\n");
      out.write("\twidth: 270px;\r\n");
      out.write("\tpadding: 15px;\r\n");
      out.write("\tborder: 1px solid #7BAEB5;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#login legend {\r\n");
      out.write("\tdirection: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#login legend {\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*입력항목 설정 */\r\n");
      out.write("#login label {\r\n");
      out.write("\tdisplay: inline-block;\r\n");
      out.write("\twidth: 80px;\r\n");
      out.write("\tfont-size: 14px;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tpadding-left: 10px;\r\n");
      out.write("\tmargin-bottom: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#login input[type='text'], input[type='password'] {\r\n");
      out.write("\tborder: 1px solid #ccc;\r\n");
      out.write("\tpadding: 3px 10px;\r\n");
      out.write("\twidth: 150px;\r\n");
      out.write("\tvertical-align: middle;\r\n");
      out.write("\tfont-size: 12px;\r\n");
      out.write("\tline-height: 150%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*버튼 크기 지정 */\r\n");
      out.write("#login input[type='submit'] {\r\n");
      out.write("\twidth: 270px;\r\n");
      out.write("\theight: 20px;\r\n");
      out.write("}\r\n");
      out.write("/*활성화input에 적용할스타일*/\r\n");
      out.write("#login fieldset .loader {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tleft: 0;\r\n");
      out.write("\ttop: 0;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tbackground: rgba(0, 0, 0, 0.3);\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("}\r\n");
      out.write("/* 활성화 input에 적용할 스타일*/\r\n");
      out.write(".active{\r\n");
      out.write("  border: 1px solid #f00;\r\n");
      out.write("  background: #98bf21;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*이미지를 로딩 박스 한 가운데 배치하기*/\r\n");
      out.write("#login .loader img {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tleft: 50%;\r\n");
      out.write("\ttop: 50%;\r\n");
      out.write("\tmargin-left: -5px;\r\n");
      out.write("\tmargin-top: -5px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-3.4.1.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("  $(function() {\r\n");
      out.write("    // focus, blur 이벤트 처리\r\n");
      out.write("    $(\"#user_name, #user_password\").bind({\r\n");
      out.write("      \"focus\": function() {\r\n");
      out.write("        $(this).addClass(\"active\");\r\n");
      out.write("      },\r\n");
      out.write("      \"blur\": function() {\r\n");
      out.write("        $(this).removeClass(\"active\");\r\n");
      out.write("      }\r\n");
      out.write("    });\r\n");
      out.write("    \r\n");
      out.write("    //submit 이벤트 처리 : 입력값 검사\r\n");
      out.write("    $(\"#login\").bind(\"submit\", function(){\r\n");
      out.write("    \tif(!$(\"#user_name\").val()){\r\n");
      out.write("    \t\talert(\"아이디를 입력하세요\");\r\n");
      out.write("    \t\t$(\"#user_name\").focus();\r\n");
      out.write("    \t\treturn false; //submit 취소용     , 이동취소            \r\n");
      out.write("    \t}\r\n");
      out.write("    \tif(!$(\"#user_password\").val()){\r\n");
      out.write("    \t\talert(\"패스워드를 입력하세요\");\r\n");
      out.write("    \t\t$(\"#user_password\").focus();\r\n");
      out.write("    \t\treturn false; //submit 취소용     , 이동취소            \r\n");
      out.write("    \t}\r\n");
      out.write("    \t$(\"#login .loader\").show();\r\n");
      out.write("    \t//가능하다면 이곳에서 Ajax로 로그인 처리를 합니다. \r\n");
      out.write("    \t//3초 후에 loader 없애기 \r\n");
      out.write("    \tsetTimeout(function(){\r\n");
      out.write("    \t\talert(\"안녕하세요. \" + $(\"#user_name\").val() + \"님\");\r\n");
      out.write("    \t\t$(\"#login .loader\").hide();\r\n");
      out.write("    \t}, 3000);\r\n");
      out.write("    \treturn false; //테스트용 \r\n");
      out.write("    });\r\n");
      out.write("  });\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<form action=\"\" id=\"login\">\r\n");
      out.write("\t\t<fieldset>\r\n");
      out.write("\t\t\t<legend>로그인</legend>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<label for=\"user_name\">아이디</label> <input type=\"text\" name=\"user_name\" id=\"user_name\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<label for=\"user_password\">비밀번호</label> <input type=\"password\" name=\"user_password\" id=\"user_password\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"로그인\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"loader\">\r\n");
      out.write("\t\t\t\t<img src=\"img/loader.gif\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
