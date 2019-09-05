package board.controller;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet(urlPatterns = { "*.do" }, initParams = { @WebInitParam(name = "propertyConfig", // 파일 관리를 효율적으로 하기위해
		value = "command.properties") })
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 요청정보와 데이터 처리 클래스를 쌍으로 저장할 Map 클래스
	private Map<String, Object> map = new HashMap<String, Object>();

	/// boardWriteForm.do(이름)=board.action.BoardWriteFormAction(이름값) 이란 이름으로 만들어진
	/// 클래스가
	// map에 저장됨
	public BoardController() {
		super();

	}

	// 요청정보와 데이터 처리 클래스가 매핑되어 있는 properties 파일을 읽어서,
	// 요청정보와 생성되어진 데이터 처리 클래스를 Map 클래스에 저장
	@Override
	public void init(ServletConfig config) throws ServletException {
		// initParams에서 propertyConfig 값읽어옴
		String propertyConfig = config.getInitParameter("propertyConfig");
		// propertyConfig = command.properties
		System.out.println("propertyConfig = " + propertyConfig);

		// "property" 폴더의 절대경로 구하기
		String realFolder = config.getServletContext().getRealPath("/property"); // 폴더의 위치를 얻어옴
		// 전체 경로 완성: 폴더위치 + 파일이름
		String realPath = realFolder + "/" + propertyConfig;
		// 요청정보와 처리클래스의 매핑정보를 저장할 Properties 객체생성
		// (확장자가 properties인 파일들을 관리 '이름(요청정보) = 데이터(처리클래스)' 값들 !)
		Properties properties = new Properties();

		// 파일을 읽어올 IO 클래스
		FileInputStream fis = null; // 문자열
		try {
			// command.properties 파일을 오픈시킴
			fis = new FileInputStream(realPath);
			// command.properties 파일의 내용을 Properties 객체에 저장
			properties.load(fis);
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
		// Set 객체의 iterator()메소드를 사용해서 Iterator 객체를 얻어냄
		Iterator<?> iterator = properties.keySet().iterator();
		// Iterator 객체에 저장된 명령어와 명령어 처리 클래스를 Map 객체에 저장
		while (iterator.hasNext()) {
			String command = (String) iterator.next(); // 왼쪽값 읽어옴
			String className = properties.getProperty(command);
			// command = /boardWriteForm.do
			// className = board.action.BoardWriteFormAction
			System.out.println("command = " + command);
			System.out.println("className = " + className);

			try { // 클래스 저장 클래스
				Class<?> commandClass = Class.forName(className); // className에 해당되는 클래스를 찾음
				System.out.println("commandClass = " + commandClass);
				// 명령어 처리 객체 생성
				Object commandInstance = commandClass.newInstance();
				map.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				// 요청정보와 생성되어진 데이터 처리클래스를 Map 클래스에 저장
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

		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProcess(request, response);
	}

	/*
	 * 1. 웹브라우저의 요청을 분석하고, 해당 요청의 처리를 수행할 model(데이터처리클래스) 실행 2. 처리결과를 view에 보냄
	 */

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String result = null; // view 처리 파일이름 저장
		Action action = null; // Data 처리 클래스 저장

		// 요청 정보 확인
		String command = request.getServletPath();
		// command = /boardWriteForm.do
		System.out.println("command = " + command);

		// 요청작업처리
		action = (Action) map.get(command);

		if (action != null) {
			try {
				// process()동작: 데이터 처리 + 데이터 공유 + view 처리 파일
				result = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 응답을 위한 view 파일을 forward로 처리
		if (result != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(result);
			dispatcher.forward(request, response);
		}
	}

}
