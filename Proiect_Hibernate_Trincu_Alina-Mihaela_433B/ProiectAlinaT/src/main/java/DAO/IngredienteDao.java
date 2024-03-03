    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Ingrediente;

/**
 *
 * @author vali
 */
public interface IngredienteDao {
    public void adaugaIngrediente (Ingrediente ingrediente);
    public List<Ingrediente> afiseazaIngrediente();
    public void modificaIngrediente (int idingredient, String nume, String pret, String unitateDeMasura, String data_expirare);
    public void stergeIngrediente (Ingrediente ingrediente);
}

    
