package Controller;

import DAO.ReteteDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Retete;
import DAOImpl.ReteteDaoImpl;

public class ReteteController extends HttpServlet {
	Retete retete = new Retete();
	ReteteDaoImpl reteteDaoImpl = new ReteteDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaRetete") != null) {
			String nume = request.getParameter("nume");
			String TimpPreparare = request.getParameter("timp_de_preparare");
			String Dificultate = request.getParameter("dificultate");
			String NumarPortii = request.getParameter("numar_portii");
			retete.setNume(nume);
			retete.setTimpPreparare(TimpPreparare);
			retete.setDificultate(Dificultate);
			retete.setNumarPortii(NumarPortii);
			reteteDaoImpl.adaugaRetete(retete);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Retete.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaRetete") != null) {
			List<Retete> listaRetete = new ArrayList();
			listaRetete = reteteDaoImpl.afiseazaRetete();
			request.setAttribute("listaRetete", listaRetete);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Retete.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaRetete") != null) {
			int id1 = Integer.parseInt(request.getParameter("idreteta"));
			String nume = request.getParameter("nume");
			String TimpPreparare = request.getParameter("timp_de_preparare");
			String Dificultate = request.getParameter("dificultate");
			String NumarPortii = request.getParameter("numar_portii");
			ReteteDaoImpl reteteDaoImpl2 = new ReteteDaoImpl();
			reteteDaoImpl2.modificaRetete(id1, nume, TimpPreparare, Dificultate, NumarPortii);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Retete.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeRetete") != null) {
			int id2 = Integer.parseInt(request.getParameter("idreteta"));
			retete.setIdreteta(id2);
			reteteDaoImpl.stergeRetete(retete);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Retete.jsp");
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


