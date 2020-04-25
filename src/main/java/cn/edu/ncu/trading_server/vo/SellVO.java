package cn.edu.ncu.trading_server.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SellVO {
    private Integer goodId;
    private String goodName;
    private String goodGame;
    private String gameServer;
    private BigDecimal goodPrice;
    private String goodPicture;
    private String goodDescription;
    private Short goodState;
}
