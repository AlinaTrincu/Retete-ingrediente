    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Asocieri;
import pojo.Retete;
import pojo.Ingrediente;


public interface AsocieriDao {
    public void adaugaAsociere (Asocieri asocieri);
    public List<Asocieri> afiseazaAsociere();
    public void modificaAsociere (Integer idlegatura, Retete retete, Ingrediente ingrediente,  String cantitate_ingredient);
    public void stergeAsociere (Asocieri asocieri);
}

    
