/**
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 * Customer.java
 */
package jsysSpring.sales.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 顧客情報を管理するエンティティクラス
 * @author FLM
 * @version 1.0 2022/03/20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer implements Serializable {

	/**
	 * 得意先コード
	 */
	private String customerCode;

	/**
	 * 得意先名
	 */
	private String customerName;

	/**
	 * 電話番号
	 */
	private String customerTelno;

	/**
	 * 郵便番号
	 */
	private String customerPostalcode;

	/**
	 * 住所
	 */
	private String customerAddress;

	/**
	 * 割引率
	 */
	private int discountRate;

}
