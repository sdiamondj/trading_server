package cn.edu.ncu.trading_server.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ApprovalVO {
    private Integer goodId;
    private String goodName;
    private String goodGame;
    private String gameServer;
    private Long goodSeller;
    private BigDecimal goodPrice;
    private String goodPicture;
}
