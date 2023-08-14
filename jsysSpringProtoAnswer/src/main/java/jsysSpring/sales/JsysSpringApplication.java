/**
 * JsysSpringApplication.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */
package jsysSpring.sales;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * アプリケーションのエントリーポイント
 * @author FLM
 * @version 1.0.0 2022/03/20
 */
@SpringBootApplication
public class JsysSpringApplication {

	/**
	 * Springアプリケーションを起動する
	 * @param args
	 */
	public static void main(String[] args) {
		SpringApplication.run(JsysSpringApplication.class, args);
	}

}
