package cn.edu.ncu.trading_server.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SearchGood {
    private Integer goodsId;
    private String goodsName;
    private String goodsGame;
    private String goodsServer;
    private String goodsSeller;
    private String goodsUpdateTime;
    private BigDecimal goodsPrice;
}
