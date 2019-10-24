package com.rhymes.app.admin.used.service;

import java.util.List;

import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.used.model.ProductsDto;

public interface AdminUsedService {

	List<ProductsDto> getAdminUsedlist(ProductsDto pDto);

	int getAdminBbsCount(AdminBbsParam adparam);

}
