/**
 * LoginController.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */

package jsysSpring.sales.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ユースケースID －
 * ユースケース名 －
 * プロトタイピング作成演習 得意先検索起動用
 * @author FLM
 * @version 1.0.0 2022/03/20
 */
@Controller
public class ProtoTypeController {

	/**
	 * プロトタイピング作成演習用トップ画面遷移
	 * 本番開発は別のコントローラーに移動予定
	 * @return /V101_01Login
	 */
	@RequestMapping("/")
	public String top(Model model) {

		// プロトタイピング作成演習用トップ画面
		return "V200_01CustomerManagementMenu";
	}

}
