package pojo;



import java.util.Date;

public class Asocieri  implements java.io.Serializable {

	private Integer idlegatura;
	private Retete retete;
	private Ingrediente ingrediente;
	private String cantitateIngredient;
	
	public Asocieri() {
	}

	public Asocieri(Retete retete, Ingrediente ingrediente, String cantitateIngredient) {
		this.retete = retete;
		this.ingrediente = ingrediente;
		this.cantitateIngredient = cantitateIngredient;
	}

	public Integer getIdlegatura() {
		return this.idlegatura;
	}

	public void setIdlegatura(Integer idlegatura) {
		this.idlegatura = idlegatura;
	}
	public Retete getRetete() {
		return this.retete;
	}

	public void setRetete(Retete retete) {
		this.retete = retete;
	}
	public Ingrediente getIngrediente() {
		return this.ingrediente;
	}

	public void setIngrediente(Ingrediente ingrediente) {
		this.ingrediente = ingrediente;
	}
	
	public String getCantitateIngredient() {
		return this.cantitateIngredient;
	}

	public void setCantitateIngredient(String cantitateIngredient) {
		this.cantitateIngredient = cantitateIngredient;
	}
}

	