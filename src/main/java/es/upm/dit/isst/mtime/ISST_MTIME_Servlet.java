package es.upm.dit.isst.mtime;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import es.upm.dit.isst.mtime.model.CITA;
import es.upm.dit.isst.mtime.dao.MTIMEDAO;
import es.upm.dit.isst.mtime.dao.MTIMEDAOImpl;


public class ISST_MTIME_Servlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		ObjectifyService.register(CITA.class);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService userService = UserServiceFactory.getUserService();
		
		//Maria ha dicho de mirar la URI!
		String url = userService.createLoginURL(request.getRequestURI());
		String urlLinktext = "Login";
		String user = "";

		MTIMEDAO dao = MTIMEDAOImpl.getInstancia();
		CITA cita = null;
		ArrayList<CITA> citas = new ArrayList<>();
		if (request.getUserPrincipal() != null){
			user = request.getUserPrincipal().getName();
			url = userService.createLogoutURL(request.getRequestURI());
			urlLinktext = "Logout";
			cita = dao.leerPorPaciente(user);
			//citas.addAll(dao.leerPorPaciente(user));
			citas.addAll(dao.leerPorDoctor(user));
			//citas.addAll(dao.leerPorFechaHora(user));
		}

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("url", url);
		request.getSession().setAttribute("urlLinktext", urlLinktext);	
		request.getSession().setAttribute("cita", cita);
		request.getSession().setAttribute("citas", citas);
		
		RequestDispatcher view = request.getRequestDispatcher("jsp/CITAVista.jsp");
		view.forward(request, response);
	}
}

