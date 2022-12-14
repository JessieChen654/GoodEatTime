package com.tibame.tga104.product.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*此為舊環境的測試檔案，切換成spring boot環境後，尚未配合環境調整*/
@WebServlet("/TestProdCategoryService")
public class ProdCategoryServiceTest_OldEnvironment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdCategoryServiceTest_OldEnvironment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ProdCategoryService service = new ProdCategoryService();
		
		// Test getOneProdCategory()
		System.out.println(service.getOneProdCategory(1).toString());
		
		// Test getAll()
//		List<ProdCategoryVO> list = service.getAll();
//		for (ProdCategoryVO p : list) {
//			System.out.println(p.toString());
//		}
		
		// Test addProdCategory()
//		ProdCategoryVO newProdCategory = service.addProdCategory("service新增");
//		System.out.println(newProdCategory);
		
		// Test updateProdCategory()
//		ProdCategoryVO updateProdCategory = service.updateProdCategory(11, "service修改");
//		System.out.println(updateProdCategory);
		
		// Test deleteProdCategory()
//		System.out.println(service.deleteProdCategory(11));
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
