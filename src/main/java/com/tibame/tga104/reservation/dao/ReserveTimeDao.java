package com.tibame.tga104.reservation.dao;

import java.util.List;

import com.tibame.tga104.reservation.vo.ReserveTimeVO;

public interface ReserveTimeDao {
	public ReserveTimeVO insert(ReserveTimeVO reserveTimeVo);

	public ReserveTimeVO updateAllowReserveNum(ReserveTimeVO reserveTimeVo);

	public ReserveTimeVO updateWeekDay(ReserveTimeVO reserveTimeVo);

	public int update(ReserveTimeVO reserveTimeVO);

	public List<ReserveTimeVO> findbyrestaurantNOandWeekDay(Integer restaurantNo, Integer weekDay);

	public List<ReserveTimeVO> findbyrestaurantNo(Integer restaurantNo);
	
	public List<Integer> getReserveTimeNo(Integer restaurantNo, Integer weekDay);

	public List<ReserveTimeVO> getAll();

}
