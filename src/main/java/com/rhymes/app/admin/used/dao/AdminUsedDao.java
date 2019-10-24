package com.rhymes.app.admin.used.dao;

import java.util.List;

import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.used.model.ProductsDto;

public interface AdminUsedDao {

	List<ProductsDto> getAdminUsedlist(ProductsDto pDto);

	int getAdminBbsCount(AdminBbsParam adparam);

}
