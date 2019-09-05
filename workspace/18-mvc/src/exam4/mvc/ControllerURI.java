package exam4.mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/ControllerURI", "*.do" }, initParams = {
		@WebInitParam(name = "propertyConfig", value = "commandURI.properties") })
public class ControllerURI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();

	public ControllerURI() {
		super();

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig");
		String realFolder = config.getServletContext().getRealPath("/property");
		String realPath = realFolder + "/" + propertyConfig; 

		Properties properties = new Properties();   //파일 관리객체
		FileInputStream fis = null;   //파일오픈시키고 읽어올준비
		try {
			fis = new FileInputStream(realPath);
			properties.load(fis); //파일 읽음 
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//commandURI.properties파일에 설정된 대로, Map 클래스에 데이터 저장
		Iterator<?> iterator = properties.keySet().iterator(); //객체의 이름값 읽어오려고! 
		while(iterator.hasNext()) {
			//commandURI.properties파일에 설정된 1줄 데이터 읽어오기 
			String command = (String)iterator.next(); //exam4/message.do(이름) = exam4.mvc.MessageAction
			String className = properties.getProperty(command);
			//객체 생성
			try {
				Class<?> commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				map.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				
				e.printStackTrace();
			}
			
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           String result = null;
           Action action = null;
           
           String command = request.getRequestURI(); 
           String contextPath = request.getContextPath();  //프로젝트값
           int contextPathLength = request.getContextPath().length(); //프로젝트글자길이
           //결과 확인
           System.out.println("command = " + command);	
           System.out.println("contextPath = " + contextPath);	
           System.out.println("contextPathLength = " + contextPathLength);	
	      
           if(command.indexOf(contextPath)==0) {
        	   command = command.substring(contextPathLength);
           }
           System.out.println("command = " + command);	
           action = (Action) map.get(command);
           try {
			result = action.process(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
        // 화면이동
        RequestDispatcher dispatcher = request.getRequestDispatcher(result);
        dispatcher.forward(request, response);
	}

}
