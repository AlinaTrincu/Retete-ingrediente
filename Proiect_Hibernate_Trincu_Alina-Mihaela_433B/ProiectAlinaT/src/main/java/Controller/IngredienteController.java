
package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Ingrediente;
import DAOImpl.IngredienteDaoImpl;

/**
 *
 * @author vali
 */
public class IngredienteController extends HttpServlet {
	Ingrediente ingrediente = new Ingrediente();
	IngredienteDaoImpl ingredienteDaoImpl = new IngredienteDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("test");
		if (request.getParameter("adaugaIngrediente") != null) {
			String nume = request.getParameter("nume");
			String pret = request.getParameter("pret");
			String unitateDeMasura = request.getParameter("unitateDeMasura");
			String dataExpirare = request.getParameter("dataExpirare");
			ingrediente.setNume(nume);
			ingrediente.setPret(pret);
			ingrediente.setUnitateMasura(unitateDeMasura);
			ingrediente.setDataExpirare(dataExpirare);
			ingredienteDaoImpl.adaugaIngrediente(ingrediente);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Ingrediente.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaIngrediente") != null) {
			List<Ingrediente> listaIngrediente = new ArrayList();
			listaIngrediente = ingredienteDaoImpl.afiseazaIngrediente();
			request.setAttribute("listaIngrediente", listaIngrediente);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Ingrediente.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaIngrediente") != null) {
			int id1 = Integer.parseInt(request.getParameter("idingredient"));
			String nume = request.getParameter("nume");
			String pret = request.getParameter("pret");
			String dataExpirare = request.getParameter("dataExpirare");
			String unitateDeMasura = request.getParameter("unitateDeMasura");
			ingredienteDaoImpl.modificaIngrediente(id1, nume, pret, unitateDeMasura, dataExpirare);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Ingrediente.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeIngrediente") != null) {
			int id2 = Integer.parseInt(request.getParameter("idingredient"));
			ingrediente.setIdingredient(id2);
			ingredienteDaoImpl.stergeIngrediente(ingrediente);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Ingrediente.jsp");
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
