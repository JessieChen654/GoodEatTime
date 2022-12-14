package com.tibame.tga104.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tibame.tga104.product.dao.ProdInfoDAO;
import com.tibame.tga104.product.vo.ProdInfoVO;

@Service
public class ProdInfoService {
	@Autowired
	private ProdInfoDAO dao;
	
	@Transactional
	public ProdInfoVO addProdInfo(Integer restaurantNo, Integer prodCategoryNo, String prodName,
			 Integer prodPrice, Integer prodStock, String prodDescription, String prodContent,
				Integer prodCommentQty, Integer totalCommentRating) {
		ProdInfoVO prodInfo = new ProdInfoVO();
		prodInfo.setRestaurantNo(restaurantNo);
		prodInfo.setProdCategoryNo(prodCategoryNo);
		prodInfo.setProdName(prodName);
		prodInfo.setProdPrice(prodPrice);
		prodInfo.setProdStock(prodStock);
		prodInfo.setProdDescription(prodDescription);
		prodInfo.setProdContent(prodContent);
		prodInfo.setProdCommentQty(prodCommentQty);
		prodInfo.setTotalCommentRating(totalCommentRating);
		
		return dao.insert(prodInfo);
	}

	@Transactional
	public ProdInfoVO updateProdInfo(Integer prodNo, Integer restaurantNo,
			Integer prodCategoryNo, String prodName, Integer prodPrice,
			Integer prodStock, String prodDescription, String prodContent,
			Integer prodCommentQty, Integer totalCommentRating) {
		ProdInfoVO prodInfo = new ProdInfoVO();
		prodInfo.setProdNo(prodNo);
		prodInfo.setRestaurantNo(restaurantNo);
		prodInfo.setProdCategoryNo(prodCategoryNo);
		prodInfo.setProdName(prodName);
		prodInfo.setProdPrice(prodPrice);
		prodInfo.setProdStock(prodStock);
		prodInfo.setProdDescription(prodDescription);
		prodInfo.setProdContent(prodContent);
		prodInfo.setProdCommentQty(prodCommentQty);
		prodInfo.setTotalCommentRating(totalCommentRating);
		
		dao.update(prodInfo);
		
		return prodInfo;
	}
	
	@Transactional
	public ProdInfoVO update(ProdInfoVO prodInfoVO) {
		return dao.update(prodInfoVO);
	}

	@Transactional
	public boolean deleteProdInfo(Integer prodNo) {
		return dao.delete(prodNo);
	}
	
	public ProdInfoVO getOneProduct(Integer prodNo) {
		return dao.findByPrimaryKey(prodNo);
	}
	
	public List<ProdInfoVO> getAll() {
		return dao.getAll();
	}
	
	public List<ProdInfoVO> getByCategory(Integer prodCategoryNo) {
		return dao.findByProdCategory(prodCategoryNo);
	}
	
	@Transactional
	public ProdInfoVO insertProd (ProdInfoVO prodInfoVO) {
		if (prodInfoVO.getProdName() != null) {
			return dao.insert(prodInfoVO);
		}
		else {
			return null;
		}
	}
	
}
