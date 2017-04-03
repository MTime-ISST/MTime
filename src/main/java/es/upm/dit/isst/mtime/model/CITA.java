package es.upm.dit.isst.mtime.model;

import java.io.Serializable;
import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class CITA implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String idCita;
	@Index
	private String paciente;
	@Index
	private String doctor;
	private String departamento;
	@Index
	private String fechaDia;
	private String fechaHora;
	private int retraso;
	
	public CITA(){}
	
	public CITA(String idCita, String paciente, String doctor, String departamento, String fechaDia, String fechaHora){
		super();
		this.idCita = idCita;
		this.paciente = paciente;
		this.doctor = doctor;
		this.departamento = departamento;
		this.fechaDia = fechaDia;
		this.fechaHora = fechaHora;
		this.retraso = 0;
	}
	@Override
	public String toString() {
		return "CITA [idCita=" + idCita + ", paciente=" + paciente + ", doctor=" + doctor + ", departamento=" + departamento
				+ ", fechaDia=" + fechaDia + ", fechaHora=" + fechaHora + ", retraso=" + retraso + "]";
	}
	public String getIdCita() {
		return idCita;
	}
	public void setIdCita(String idCita) {
		this.idCita = idCita;
	}
	
	public String getPaciente() {
		return paciente;
	}

	public void setPaciente(String paciente) {
		this.paciente = paciente;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getFechaDia() {
		return fechaDia;
	}

	public void setFechaDia(String fechaDia) {
		this.fechaDia = fechaDia;
	}	
	
	public String getFechaHora() {
		return fechaHora;
	}

	public void setFechaHora(String fechaHora) {
		this.fechaHora = fechaHora;
	}

	public int getRetraso() {
		return retraso;
	}

	public void setRetraso(int retraso) {
		this.retraso = retraso;
	}
}
