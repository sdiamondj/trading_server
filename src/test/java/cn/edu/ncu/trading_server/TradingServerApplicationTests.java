package cn.edu.ncu.trading_server;

import cn.edu.ncu.trading_server.config.MyUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class TradingServerApplicationTests {



    @Test
    void md5Test(){
        try {
            String md5 = MyUtil.md5("0528");
            System.out.println(md5);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
