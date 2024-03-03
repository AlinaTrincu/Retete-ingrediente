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
import pojo.Asocieri;
import DAO.AsocieriDao;
import java.util.Date;
import pojo.Retete;
import pojo.Ingrediente;

/**
 *
 * @author vali
 */
public class AsocieriDaoImpl implements AsocieriDao{

    public void adaugaAsocieri(Asocieri asocieri) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(asocieri);
        transaction.commit();
        session.close();
    }

    public List<Asocieri> afiseazaAsocieri() {
        List<Asocieri> listaAsociere = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.query.Query query = session.createQuery("From Asocieri");
        listaAsociere = query.list();
        return listaAsociere;
    }

    public void modificaAsocieri(Integer idlegatura, Retete retete, Ingrediente ingrediente,  String cantitate_ingredient) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Asocieri detaliiAsocieri;
        detaliiAsocieri = (Asocieri) session.load(Asocieri.class, idlegatura);
        detaliiAsocieri.setRetete(retete);
        detaliiAsocieri.setIngrediente(ingrediente);
        detaliiAsocieri.setCantitateIngredient(cantitate_ingredient);
        session.update(detaliiAsocieri);
        transaction.commit();
        session.close();
    }

    public void stergeAsocieri(Asocieri asocieri) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(asocieri);
        transaction.commit();
        session.close();
    }

	@Override
	public void adaugaAsociere(Asocieri asocieri) {
		Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(asocieri);
        transaction.commit();
        session.close();
	}

	@Override
	public List<Asocieri> afiseazaAsociere() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modificaAsociere(Integer idlegatura, Retete retete, Ingrediente ingrediente,
			String cantitate_ingredient) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stergeAsociere(Asocieri asocieri) {
		// TODO Auto-generated method stub
		
	}}

