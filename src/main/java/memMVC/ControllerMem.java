package memMVC;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

@WebServlet("/ControllerMem.do")
public class ControllerMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerMem() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // doPost를 해줘야 함, 경로 이동은 Get에서 하기 때문에 안하면 오류남
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String contextPath = request.getContextPath();
		String realPath = contextPath + "/bookStore/pages/";
        String category = request.getParameter("category");

        String vId = request.getParameter("mem_id");
        String vPwd= request.getParameter("mem_pwd");
        String vName = request.getParameter("mem_name");
        String vEmail = request.getParameter("mem_email");
        String vPhone = request.getParameter("mem_phone");
        String vAdd1 = request.getParameter("mem_add1");
        String vAdd2 = request.getParameter("mem_add2");

        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = new MemberDTO(vId, vPwd, vName, vEmail, vPhone, vAdd1, vAdd2);

        int su = 0;
        String msg = "";
        String sendPath = "";
		HttpSession session = request.getSession();
		System.out.println("contextPath: " + request.getContextPath());

        switch (category) {
	        case "signup":
	        	System.out.println("회원가입 이동");
	            sendPath = realPath + "signup.jsp";
	            break;
	        case "login":
	        	System.out.println("로그인 이동");
	        	sendPath = realPath + "login.jsp";
	            break;
	        case "update":
	        	System.out.println("회원수정 이동");
	        	sendPath = realPath + "update.jsp";
	            break;
	        case "delete":
	        	System.out.println("회원탈퇴 이동");
	        	sendPath = realPath + "delete.jsp";
	            break;
            case "frmIns":
            	su = dao.memIns(dto);
            	if(su != 0) {
            		msg = vId + "님 가입 성공";
            		sendPath = realPath + "login.jsp";
            	} else {
            		msg = "아이디가 중복됩니다. 다시 입력해주세요.";
            		sendPath = realPath + "signup02.jsp?msg=" + URLEncoder.encode(msg, "UTF-8");
            	}
                System.out.println(msg);
                break;
            case "frmLog":
            	su = dao.memLog(dto);
            	if(su != 0) {
            		msg = vId + "님 로그인 성공";
        			session.setAttribute("log_id", vId);
                    sendPath = realPath + "main.jsp";
            	} else {
            		msg = "아이디나 비밀번호가 존재하지 않습니다.";
            		sendPath = realPath + "login.jsp?msg=" + URLEncoder.encode(msg, "UTF-8");
            	}
                System.out.println(msg);
                break;
            case "frmUpd":
            	su = dao.memUpd(dto);
            	if(su != 0) {
            		msg = vId + "님 수정 성공";
            		sendPath = realPath + "mypage.jsp";
            	} else {
            		msg = "수정 실패";
            		sendPath = realPath + "update.jsp?msg=" + URLEncoder.encode(msg, "UTF-8");
            	}
                System.out.println(msg);
                break;
            case "frmDel":
            	su = dao.memDel(dto);
            	if(su != 0) {
            		msg = vId + "님 탈퇴 성공";
            		session.invalidate();
                    sendPath = realPath + "main.jsp";
            	} else {
            		msg = "아이디나 비밀번호가 틀렸습니다.";
            		sendPath = realPath + "delete.jsp?msg=" + URLEncoder.encode(msg, "UTF-8");
            	}
                System.out.println(msg);
                break;
            default:
                sendPath = realPath + "main.jsp";
        }
        response.sendRedirect(sendPath);
		System.out.println("sendPath: " + sendPath);
    }
}
