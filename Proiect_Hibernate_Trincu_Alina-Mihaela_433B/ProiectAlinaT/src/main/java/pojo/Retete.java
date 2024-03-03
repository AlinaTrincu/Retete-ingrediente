package pojo;



import java.util.HashSet;
import java.util.Set;

public class Retete  implements java.io.Serializable {


	private Integer idreteta;
	private String nume;
	private String timpPreparare;
	private String dificultate;
	private String numarPortii;
	private Set asociere = new HashSet(0);

	public Retete() {
	}

	public Retete(String nume, String timp_de_preparare, String dificultate,String numar_portii, Set asociere) {
		this.nume = nume;
		this.timpPreparare = timp_de_preparare;
		this.dificultate = dificultate;
		this.numarPortii = numar_portii;
		this.asociere = asociere;
	}

	public Integer getIdreteta() {
		return this.idreteta;
	}

	public void setIdreteta(Integer idreteta) {
		this.idreteta = idreteta;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getTimpPreparare() {
		return this.timpPreparare;
	}

	public void setTimpPreparare(String timp_de_preparare) {
		this.timpPreparare = timp_de_preparare;
	}
	public String getDificultate() {
		return this.dificultate;
	}

	public void setDificultate(String dificultate) {
		this.dificultate = dificultate;
	}
	public String getNumarPortii() {
		return this.numarPortii;
	}

	public void setNumarPortii(String numar_portii) {
		this.numarPortii = numar_portii;
	}
	public Set getAsociere() {
		return this.asociere;
	}

	public void setAsociere(Set asociere) {
		this.asociere = asociere;
	}
}




