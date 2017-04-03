package es.upm.dit.isst.mtime.dao;

import java.util.List;

import es.upm.dit.isst.mtime.model.CITA;

public interface MTIMEDAO {
	public CITA crearCITA(String idCita, String paciente, String doctor, String departamento, String fechaDia, String fechaHora);
	public List<CITA> leerTodasCITAS();
	public CITA leerPorIdCita(String idCita);	
	public CITA leerPorPaciente(String paciente);
	public List<CITA> leerPorDoctor(String doctor);
	public List<CITA> leerPorFechaDia(String fechaDia);
	public CITA actualizaCITA(CITA cita);
	public CITA borraCITA(CITA cita);
	/*
	 * Carlos el pedante propone que borrar cita devuelve un booleano de mierda
	 */
}


