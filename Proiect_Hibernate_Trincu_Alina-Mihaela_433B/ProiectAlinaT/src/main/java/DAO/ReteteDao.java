    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Retete;

/**
 *
 * @author vali
 */
public interface ReteteDao {
    public void adaugaRetete (Retete retete);
    public List<Retete> afiseazaRetete();
    public void modificaRetete (int idreteta, String nume, String timp_de_preparare,String dificultate, String numar_portii);
    public void stergeRetete (Retete retete);
}

    
