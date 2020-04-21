package cn.edu.ncu.trading_server.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderVO {
    private Integer orderId;
    private String goodName;
    private String orderCreateTime;
    private String orderUpdateTime;
    private BigDecimal orderPrice;
    private Short orderState;
    private String game;
    private String server;
    private String account;
}
