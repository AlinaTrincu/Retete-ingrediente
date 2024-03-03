package pojo;

import java.util.HashSet;
import java.util.Set;

public class Ingrediente implements java.io.Serializable {

	private Integer idingredient;
	private String nume;
	private String pret;
	private String dataExpirare;
	private String unitateMasura;
	private Set asociere = new HashSet(0);

	public Ingrediente() {
	}

	public Ingrediente(String nume, String unitate_de_masura, String pret, String data_expirare, Set asociere) {
		this.nume = nume;
		this.pret = pret;
		this.dataExpirare = data_expirare;
		this.unitateMasura = unitate_de_masura;
		this.asociere = asociere;
	}

	public Integer getIdingredient() {
		return this.idingredient;
	}

	public void setIdingredient(Integer idingredient) {
		this.idingredient = idingredient;
	}

	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}

	public String getUnitateMasura() {
		return this.unitateMasura;
	}

	public void setUnitateMasura(String um) {
		this.unitateMasura = um;
	}

	public String getPret() {
		return this.pret;
	}

	public void setPret(String pret) {
		this.pret = pret;
	}

	public String getDataExpirare() {
		return this.dataExpirare;
	}

	public void setDataExpirare(String data_expirare) {
		this.dataExpirare = data_expirare;
	}

	public Set getAsociere() {
		return this.asociere;
	}

	public void setAsociere(Set asociere) {
		this.asociere = asociere;
	}
}
