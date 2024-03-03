package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Retete;
import pojo.Ingrediente;
import pojo.Asocieri;
import DAOImpl.AsocieriDaoImpl;
import DAOImpl.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;

/**
 *
 * @author vali
 */
public class AsocieriController extends HttpServlet {
	Asocieri asocieri = new Asocieri();
	AsocieriDaoImpl asocieriDaoImpl = new AsocieriDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaAsociere") != null) {
			// preluarea parametrilor de interes
			Integer idreteta = java.lang.Integer.parseInt(request.getParameter("idreteta"));
			Integer idingredient = java.lang.Integer.parseInt(request.getParameter("idingredient"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Retete retete = (Retete) session.get(Retete.class, idreteta);
			Ingrediente ingrediente = (Ingrediente) session.get(Ingrediente.class, idingredient);
			String cantitateIngredient = request.getParameter("cantitateIngredient");
		
			asocieri.setRetete(retete);
			asocieri.setIngrediente(ingrediente);
			asocieri.setCantitateIngredient(cantitateIngredient);

			AsocieriDaoImpl asocieriDaoImpl2 = new AsocieriDaoImpl();
			asocieriDaoImpl2.adaugaAsociere(asocieri);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Asocieri.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaAsociere") != null) {
			List<Asocieri> listaAsocieri = new ArrayList();
			listaAsocieri = asocieriDaoImpl.afiseazaAsocieri();
			request.setAttribute("listaAsocieri", listaAsocieri);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Asocieri.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaAsocieri") != null) {
			Integer id1 = Integer.parseInt(request.getParameter("idlegatura"));
			// preluarea parametrilor de interes
			Integer idreteta = java.lang.Integer.parseInt(request.getParameter("idreteta"));
			Integer idingredient = java.lang.Integer.parseInt(request.getParameter("idingredient"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Retete retete = (Retete) session.get(Retete.class, idreteta);
			Ingrediente ingrediente = (Ingrediente) session.get(Ingrediente.class, idingredient);
			String CantitateIngredient = request.getParameter("cantitate_ingredient");

			asocieriDaoImpl.modificaAsocieri(id1, retete, ingrediente,  CantitateIngredient);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Asocieri.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeAsocieri") != null) {
			Integer id2 = Integer.parseInt(request.getParameter("idlegatura"));
			asocieri.setIdlegatura(id2);
			asocieriDaoImpl.stergeAsocieri(asocieri);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Asocieri.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


