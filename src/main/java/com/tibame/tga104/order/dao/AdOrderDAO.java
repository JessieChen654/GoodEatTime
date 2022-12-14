package com.tibame.tga104.order.dao;


import com.tibame.tga104.order.vo.AdOrder;

import java.util.List;

public interface AdOrderDAO {
    Integer createAdOrder(AdOrder adOrder);

    void updateAdOrder(Integer adOrderNo, AdOrder adOrder);

    void deleteByAdOrderNo(Integer adOrderNo);

    AdOrder getByAdOrderNo(Integer adOrderNo);

    AdOrder getByRestaurantNo(Integer restaurantNo);

    List<AdOrder> getByAll();
}
