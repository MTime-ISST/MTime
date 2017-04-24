package es.upm.dit.isst.mtime.dao;

import java.util.Date;
import java.util.List;
import com.googlecode.objectify.Key;
import es.upm.dit.isst.mtime.model.CITA;
import es.upm.dit.isst.mtime.dao.MTIMEDAOImpl;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class MTIMEDAOImpl implements MTIMEDAO{
	
	private static MTIMEDAOImpl instancia;
	
	private MTIMEDAOImpl () {
	}
	
	public static MTIMEDAOImpl getInstancia() {
		if (instancia == null)
			instancia= new MTIMEDAOImpl();
		return instancia;
	}

	@Override
	public CITA crearCITA(String idCita, String paciente, String doctor, String departamento, String fechaDia, String fechaHora){
		CITA cita = new CITA(idCita, paciente, doctor, departamento, fechaDia, fechaHora);
		ofy().save().entity(cita).now();
		return cita;
	}

	@Override
	public List<CITA> leerTodasCITAS() {
		List<CITA> citas = ofy().load().type(CITA.class).list();
		return citas;
	}

	@Override
	public CITA leerPorIdCita(String idCita) {
		CITA citas = ofy().load().type(CITA.class).filterKey(Key.create(CITA.class, idCita)).first().now();
		return citas;
	}

	@Override
	public List<CITA> leerPorPaciente(String paciente) {
		List<CITA> cita = ofy().load().type(CITA.class).filter("paciente", paciente).list();
		return cita;
	}

	@Override
	public List<CITA> leerPorDoctor(String doctor) {
		List<CITA> citas = ofy().load().type(CITA.class).filter("doctor", doctor).list();
		return citas;
	}
	
	
	@Override
	public List<CITA> leerPorFechaDia(String fechaDia) {
		List<CITA> citas = ofy().load().type(CITA.class).filter("fechaDia", fechaDia).list();
		return citas;
	}
	

	@Override
	public CITA actualizaCITA(CITA cita) {
		ofy().save().entity(cita).now();
		return cita;
	}

	@Override
	public CITA borraCITA(CITA cita) {
		ofy().delete().entity(cita).now();
		return cita;
	}

}
