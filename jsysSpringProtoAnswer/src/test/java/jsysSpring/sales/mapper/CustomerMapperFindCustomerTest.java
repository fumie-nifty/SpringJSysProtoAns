/**
 * CustomerMapperFindCustomerTest.java
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */

package jsysSpring.sales.mapper;

import static com.github.springtestdbunit.annotation.DatabaseOperation.*;
import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;

import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.DatabaseTearDown;

import jsysSpring.sales.entity.Customer;
import jsysSpring.sales.test.util.ExecuteQueryForTestService;

/**
 * CustomerMapper.findCustomer()メソッドのテストをするクラス
 * @author FLM
 * @version 1.0 2022/03/20
 */
@SpringBootTest
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
		DirtiesContextTestExecutionListener.class,
		TransactionalTestExecutionListener.class,
		DbUnitTestExecutionListener.class })
@DatabaseSetup("classpath:AllTest/setupJsysDB.xml")
@DatabaseTearDown("classpath:AllTest/setupJsysDB.xml")
@DisplayName("PT002_01:CustomerMapper.findCustomer()メソッドのテスト")
public class CustomerMapperFindCustomerTest {

	@Autowired
	CustomerMapper sut;

	@Autowired
	ExecuteQueryForTestService executeQueryForTestService;

	@Test
	@DisplayName("PT002_01_001：検索が成功する場合")
	void test001() {
		// setup
		String testArg_customerCode = "KA0001";
		Customer expected = new Customer("KA0001", "Aストア", "045-128-3581",
			"220-0001", "横浜市西区北幸２－１", 0);

		// assert
		assertThat(sut.findCustomer(testArg_customerCode)).isEqualTo(expected);

	}

	@Test
	@DisplayName("PT002_01_002：検索が失敗する場合（存在しない得意先番号）")
	void test002() {
		// setup
		String testArg_customerCode = "KA9999";

		// assert
		assertThat(sut.findCustomer(testArg_customerCode)).isNull();

	}

	@Test
	@DisplayName("PT002_01_003：検索が失敗する場合（削除済み得意先）")
	void test003() {
		// setup
		String testArg_customerCode = "KA0002";

		// assert
		assertThat(sut.findCustomer(testArg_customerCode)).isNull();

	}

	@Test
	@DatabaseSetup(type = DELETE_ALL)
	@DisplayName("PT002_01_004：検索が失敗する場合（レコード0件）")
	void test004() {
		// setup
		String testArg_customerCode = "KA0001";

		// assert
		assertThat(sut.findCustomer(testArg_customerCode)).isNull();

	}

	@Nested
	@SpringBootTest
	@DisplayName("PT002_01_005：DataAccessExceptionが発生する場合")
	class CustomerTableRenamed {

		@BeforeEach
		void setUp() throws Exception {
			executeQueryForTestService.renameTable("customer", "customer2");
		}

		@AfterEach
		void tearDown() throws Exception {
			executeQueryForTestService.renameTable("customer2", "customer");
		}

		@Test
		@DisplayName("得意先情報の取得に失敗する")
		void test005() throws Exception {
			// setup
			String testArg_customerCode = "KA0001";
			// assert
			assertThatThrownBy(() -> sut.findCustomer(testArg_customerCode))
				.isInstanceOf(DataAccessException.class);
		}
	}
}
