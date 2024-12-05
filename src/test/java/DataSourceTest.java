import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.Connection;

public class DataSourceTest {

    @Test
    public void testConnection(){
        ApplicationContext c = new FileSystemXmlApplicationContext("file:src/main/webapp/WEB-INF/applicationContext.xml");
        DataSource ds = (DataSource) c.getBean("dataSource");
        try{
            Connection con = ds.getConnection();
            System.out.println("Database connection established");
        }
        catch(Exception e){
            System.out.println("Database connection failed");
        }
    }
}
