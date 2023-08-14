/**
 * SearchCustomerServiceImpl.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */

package jsysSpring.sales.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jsysSpring.sales.common.exception.SalesBusinessException;
import jsysSpring.sales.entity.Customer;
import jsysSpring.sales.mapper.CustomerMapper;

/**
 * 得意先検索Serviceの実装クラス
 * @author FLM
 * @version 1.0.0
 */
@Service
public class SearchCustomerServiceImpl implements SearchCustomerService {

	/** Mapper */
	@Autowired
	private CustomerMapper customerMapper;

	/**
	 * @see jsysSpring.sales.service.SearchCustomerService#searchCustomer(java.lang.String)
	 */
	@Override
	public Customer searchCustomer(String customerCode)
			throws SalesBusinessException {

		//Mapperのメソッドを呼び出し、得意先情報を取得
		Customer customer = customerMapper.findCustomer(customerCode);

		//得意先情報がnullの場合は、SalesBusinessExceptionをスロー
		if(customer==null) {
			throw new SalesBusinessException(customerCode + "に一致する得意先情報が存在しません。");
		}

		//得意先情報を返却
		return customer;
	}

}
