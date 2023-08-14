/**
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 * CustomerMapper.java
 */
package jsysSpring.sales.mapper;

import jsysSpring.sales.entity.Customer;

import org.apache.ibatis.annotations.Mapper;

/**
 * CUSTOMERテーブルを利用するMapperインターフェイス
 * @author FLM
 * @version 1.0 2022/03/20
 */

@Mapper
public interface CustomerMapper {

	/**
	 * 得意先を1件検索する。
	 * @param custCode 得意先コード
	 * @return 得意先
	 */
	public Customer findCustomer(String customerCode);

}
