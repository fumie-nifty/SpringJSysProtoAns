/**
 * SearchCustomerController.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */

package jsysSpring.sales.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jsysSpring.sales.common.exception.SalesBusinessException;
import jsysSpring.sales.entity.Customer;
import jsysSpring.sales.form.SearchCustomerForm;
import jsysSpring.sales.service.SearchCustomerService;

/**
 * ユースケースID		UC201
 * ユースケース名		得意先を検索する
 * 得意先検索機能を管理するコントローラクラス
 * @author FLM
 * @version 1.0.0 2022/03/20
 */
@Controller
public class SearchCustomerController {

	/** Service */
	@Autowired
	SearchCustomerService service;

	/**
	 * 得意先検索画面の遷移
	 * @return /customer/V201_01CustomerFindView
	 */
	@RequestMapping("/goSearchCustomer")
	public String goSearchCustomer(Model model) {

		// 得意先検索情報フォームオブジェクトをModelに設定
		model.addAttribute("searchCustomerForm", new SearchCustomerForm());

		//得意先検索画面
		return "/V201_01CustomerFindView";
	}

	/**
	 * 得意先を検索し、得意先検索結果画面を表示する
	 * マッピングするURL： /searchCustomer
	 * マッピングするHTTPメソッド： POST
	 * @param form 得意先検索情報入力フォーム
	 * @param result 入力値検証結果オブジェクト
	 * @return 得意先検索結果画面（/customer/V101_02MainMenu）
	 */
	@RequestMapping(value = "/searchCustomer", method = RequestMethod.POST)
	public String searchCustomer(
			@ModelAttribute("searchCustomerForm") @Validated SearchCustomerForm form,
			BindingResult result,Model model) {

		// 入力チェック
		if (result.hasErrors()) {
			// 得意先検索画面
			return "/V201_01CustomerFindView";
		}

		//得意先検索情報入力フォームから得意先コードを取得
		String customerCode = form.getCustomerCode();

		//serviceのsearchCustomerを呼び出し、得意先情報を取得
		Customer customer = service.searchCustomer(customerCode);

		//modelに得意先情報を設定
		model.addAttribute(customer);

		//得意先検索結果画面
		return "/V201_02CustomerFindResultView";
	}

	/**
	 * 業務例外のハンドリング
	 * ハンドリングする例外クラス： SalesBusinessException.class
	 */
	@ExceptionHandler(SalesBusinessException.class)
	public String catchBizException(Model model, Exception e) {

		// エラーメッセージをModelに設定
		model.addAttribute("message", e.getMessage());

		// フォームオブジェクトをModelに設定
		model.addAttribute("searchCustomerForm", new SearchCustomerForm());

		return "/V201_01CustomerFindView";
	}

}
