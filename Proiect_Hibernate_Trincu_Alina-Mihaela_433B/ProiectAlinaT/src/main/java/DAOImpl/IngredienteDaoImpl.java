/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Ingrediente;
import DAO.IngredienteDao;

/**
 *
 * @author vali
 */
public class IngredienteDaoImpl implements IngredienteDao{

    public void adaugaIngrediente(Ingrediente ingrediente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(ingrediente);
        transaction.commit();
        session.close();
    }

    public List<Ingrediente> afiseazaIngrediente() {
        List<Ingrediente> listaIngrediente = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Ingrediente");
        listaIngrediente = query.list();
        return listaIngrediente;
    }

    public void modificaIngrediente(int idingredient, String nume, String pret, String unitateDeMasura, String data_expirare) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Ingrediente detaliiIngrediente = (Ingrediente) session.load(Ingrediente.class, idingredient);
        detaliiIngrediente.setNume(nume);
        detaliiIngrediente.setPret(pret);
        detaliiIngrediente.setDataExpirare(data_expirare);
        detaliiIngrediente.setUnitateMasura(unitateDeMasura);
        session.update(detaliiIngrediente);
        transaction.commit();
        session.close();
    }

    public void stergeIngrediente(Ingrediente ingrediente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(ingrediente);
        transaction.commit();
        session.close();
    }
}
