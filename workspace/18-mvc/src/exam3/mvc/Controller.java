package exam3.mvc;

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


@WebServlet(
		  urlPatterns = {"/Controller"},
		  initParams = {
				@WebInitParam(name = "propertyConfig", value = "command.properties")	 
		  })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
     //명령어와 명령어 처리 클래스를 쌍으로 저장할 Map클래스
	 private Map<String, Object> map = new HashMap<String, Object>();
	 
    public Controller() {
        super();
       
    }

    //명령어와 명령어 처리 클래스가 매핑되어 있는 properties  파일을 읽어 Map 클래스에 저장 
	@Override        //서블릿에 있는 여러가지는 config을 통해 사용 가능 
	public void init(ServletConfig config) throws ServletException { 
		   System.out.println("init() 호출");
		  // initParams에서 propertyConfig의 값(command.properties)을 읽어옴
		 String propertyConfig = config.getInitParameter("propertyConfig");
		 System.out.println(" propertyConfig = " + propertyConfig);
		 // " /property" 폴더의 절대경로 구하기 (하드디스크 ->램으로 읽어오려고 작업)
		 String realFolder = config.getServletContext().getRealPath("/property");
         String realPath = realFolder + "/" + propertyConfig;
         // 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
         Properties properties = new Properties(); //확장자가 properties인 파일 
         //파일을 읽어올 IO클래스
         FileInputStream fis = null;
         try {
			 //command.properties 파일 읽어오기 
        	 fis = new FileInputStream(realPath);
        	//command.properties 파일의 내용을 Properties 객체에 저장
        	 properties.load(fis);   // 확장자가 properties 인 애들만 관리
		} catch (FileNotFoundException e) {	
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}finally {
			try {
			   if(fis!=null) fis.close();
			} catch (IOException e) {
			
				e.printStackTrace();
			}
		}
         //iterator()메소드를 사용해서 Iterator 객체를 얻어냄
         Iterator<?> iterator = properties.keySet().iterator();
         //Iterator 객체에 저장된 명령어와 명령어 처리 클래스를 Map 객체에 저장
         while(iterator.hasNext()) {
        	 String command = (String) iterator.next();   //이름 : message = exam3.mvc.MessageAction 
        	 String className = properties.getProperty(command); //데이터  
        	 //결과확인
        	 System.out.println("command =" + command);
        	 System.out.println("className =" + className);
        	 
        	 try {
				Class<?> commandClass = Class.forName(className); //모든 클래스를 저장하는 클래스 /클래스 리턴 
				//결과확인
				System.out.println("commandClass = " + commandClass);		
			    //newInstance() : 객체 생성 메소드  -> 객체리턴 (exam3.mvc.MessageAction라는 클래스객체를 만들고 리턴, Object(부모)이기 때문에 저장 가능)
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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		process(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
	}
	
	//1.웹 브라우저의 요청을 분석하고 , 해당 요청의 처리를 수행할 model(클래스) 실행
	//2.처리결과를 view(jsp 파일)에 보냄            
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("process()호출");
		 String result = null;
         Action action = null;
         //웹브라우저의 요청을 분석하고, 해당 요청의 처리를 수행할 model 실행
         String command = request.getParameter("command");  //command 에는 message가 저장이됨 
         action = (Action) map.get(command); //if-else부분과 똑같음 /Map클래스로부터 동작될 클래스를 얻어옴 
         try {
			result = action.process(request, response);
		} catch (Throwable e) {
		
			e.printStackTrace();
		}
		//처리 결과를 view 에 보냄 
        RequestDispatcher dispatcher = request.getRequestDispatcher(result);
        dispatcher.forward(request, response);
	}

}
