package prisma

import org.hibernate.dialect.MySQL5InnoDBDialect
import java.sql.Types

class MyCustomMySQL5InnoDBDialect extends MySQL5InnoDBDialect {
	
	MyCustomMySQL5InnoDBDialect() {
		registerColumnType(Types.BIT, 'boolean')
	}

	@Override
	public String getTableTypeString() {
		return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
	}
}

