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
import pojo.Retete;
import DAO.ReteteDao;

/**`
 *
 * @author vali
 */
public class ReteteDaoImpl implements ReteteDao{

    public void adaugaRetete(Retete retete) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(retete);
        transaction.commit();
        session.close();
    }

    public List<Retete> afiseazaRetete() {
        List<Retete> listaRetete = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Retete");
        listaRetete = query.list();
        return listaRetete;
    }

    public void modificaRetete(int idreteta, String nume, String timp_de_preparare, String dificultate , String numar_portii) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Retete detaliiretete = (Retete) session.load(Retete.class, idreteta);
        detaliiretete.setNume(nume);
        detaliiretete.setTimpPreparare(timp_de_preparare);
        detaliiretete.setDificultate(dificultate);
        detaliiretete.setNumarPortii(numar_portii);
        session.update(detaliiretete);
        transaction.commit();
        session.close();
    }

    public void stergeRetete(Retete retete) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(retete);
        transaction.commit();
        session.close();
    }

	
}
