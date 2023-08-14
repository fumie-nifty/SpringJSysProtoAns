/**
 * ServletInitializer.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */
package jsysSpring.sales;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @see SpringBootServletInitializer
 * @author FLM
 * @version 1.0.0 2022/03/20
 */
public class ServletInitializer extends SpringBootServletInitializer {

	/**
	 * @see SpringBootServletInitializer#configure(SpringApplicationBuilder)
	 */
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(JsysSpringApplication.class);
	}

}
