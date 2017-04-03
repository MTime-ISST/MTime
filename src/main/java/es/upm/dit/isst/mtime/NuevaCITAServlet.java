package es.upm.dit.isst.mtime;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import es.upm.dit.isst.mtime.dao.MTIMEDAO;
import es.upm.dit.isst.mtime.dao.MTIMEDAOImpl;

public class NuevaCITAServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String idCita = req.getParameter("idCita");
		String idCita = "" + System.currentTimeMillis();
		String paciente = req.getParameter("paciente");
		String doctor= req.getParameter("doctor");
		String departamento= req.getParameter("departamento");
		String fecha = req.getParameter("fecha");
		String[] parts = fecha.split("-") ;
		String fechaDia = parts[2]+"/" + parts[1]+ "/" + parts[0];
		String fechaHora = req.getParameter("fechaHora");
	
		MTIMEDAO dao = MTIMEDAOImpl.getInstancia();
		dao.crearCITA(idCita, paciente, doctor, departamento, fechaDia, fechaHora);

		resp.sendRedirect("/isst_mtime");

	}
}
