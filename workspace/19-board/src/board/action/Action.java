package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {                                                          //Exception 가능 
   public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
