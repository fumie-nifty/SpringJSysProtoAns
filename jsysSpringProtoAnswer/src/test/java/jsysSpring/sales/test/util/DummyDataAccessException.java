/**
 * DuumyDataAccessException.java
 * All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited
 */

package jsysSpring.sales.test.util;
import org.springframework.dao.DataAccessException;

/**
 * @author FLM
 * @version 1.0 2022/03/20
 */
public class DummyDataAccessException extends DataAccessException {

	public DummyDataAccessException() {
		super(null);
	}
}
