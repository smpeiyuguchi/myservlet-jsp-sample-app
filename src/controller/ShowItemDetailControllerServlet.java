package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import domain.Item;
import domain.Topping;
import model.ItemDbUtil;
import model.ToppingDbUtil;

/**
 * Servlet implementation class ShowItemDetailControllerServlet
 */
@WebServlet("/show_item_detail")
public class ShowItemDetailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ItemDbUtil itemDbUtil;
	private ToppingDbUtil toppingDbUtil;
	@Resource(name = "jdbc/postgres")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			itemDbUtil = new ItemDbUtil(dataSource);
			toppingDbUtil = new ToppingDbUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int itemId = Integer.parseInt(request.getParameter("itemId"));
		try {
			Item item = itemDbUtil.load(itemId);
			List<Topping> toppingList = toppingDbUtil.findAll();
			item.setToppingList(toppingList);
			request.setAttribute("item", item);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/item_detail.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
