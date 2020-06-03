package controller;

import java.io.IOException;
import java.util.ArrayList;
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
import model.ItemDbUtil;

/**
 * Servlet implementation class ShowItemListControllerServlet
 */
@WebServlet("/ShowItemListControllerServlet")
public class ShowItemListControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// フィールドの定義
	private ItemDbUtil itemDbUtil;
	@Resource(name = "jdbc/postgres")
	private DataSource dataSource;

	// モデルの初期化
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			itemDbUtil = new ItemDbUtil(dataSource);
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
		try {
			List<Item> allItemList = itemDbUtil.findAll();

			// 商品を3つずつ別のリストに格納する
			List<List<Item>> itemList = new ArrayList<>();
			List<Item> threeItemList = null;
			for (int index = 0; index < allItemList.size(); index++) {
				if ((index) % 3 == 0) {
					threeItemList = new ArrayList<>();
				}
				threeItemList.add(allItemList.get(index));
				if ((index + 1) % 3 == 0) {
					itemList.add(threeItemList);
				}
			}
			
			// スコープにセット
			request.setAttribute("itemList", itemList);
			
			// 遷移先のJSPを指定
			RequestDispatcher dispatcher = request.getRequestDispatcher("/item_list_curry.jsp");
			
			// JSPに遷移
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}
		
	}

}
