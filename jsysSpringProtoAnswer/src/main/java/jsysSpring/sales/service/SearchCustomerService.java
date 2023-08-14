/**
 * SearchCustomerService.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */

package jsysSpring.sales.service;

import jsysSpring.sales.common.exception.SalesBusinessException;
import jsysSpring.sales.entity.Customer;

/**
 * 得意先検索Service
 * @author FLM
 * @version 1.0.0
 */
public interface SearchCustomerService {
	/**
	 * customerCodeをもとに得意先情報を検索し返却する
	 * @param customerCode 得意先コード
	 * @return 得意先情報
	 * @throws SalesBusinessException 検索結果が存在しない場合
	 */
	public Customer searchCustomer(String customerCode) throws SalesBusinessException;

}
