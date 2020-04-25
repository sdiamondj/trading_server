package cn.edu.ncu.trading_server.entity;

import lombok.AllArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

public class Good {
    private Integer goodsId;

    private String goodsName;

    private Integer goodsGame;

    private Integer goodsSeller;

    private BigDecimal goodsPrice;

    private Short goodsState;

    private String goodsGameServer;

    private String goodsUpdateTime;

    private String goodsDescription;

    private String goodsPicture;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getGoodsGame() {
        return goodsGame;
    }

    public void setGoodsGame(Integer goodsGame) {
        this.goodsGame = goodsGame;
    }

    public Integer getGoodsSeller() {
        return goodsSeller;
    }

    public void setGoodsSeller(Integer goodsSeller) {
        this.goodsSeller = goodsSeller;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Short getGoodsState() {
        return goodsState;
    }

    public void setGoodsState(Short goodsState) {
        this.goodsState = goodsState;
    }

    public String getGoodsGameServer() {
        return goodsGameServer;
    }

    public void setGoodsGameServer(String goodsGameServer) {
        this.goodsGameServer = goodsGameServer == null ? null : goodsGameServer.trim();
    }

    public String getGoodsUpdateTime() {
        return goodsUpdateTime;
    }

    public void setGoodsUpdateTime(String goodsUpdateTime) {
        this.goodsUpdateTime = goodsUpdateTime == null ? null : goodsUpdateTime.trim();
    }

    public String getGoodsDescription() {
        return goodsDescription;
    }

    public void setGoodsDescription(String goodsDescription) {
        this.goodsDescription = goodsDescription == null ? null : goodsDescription.trim();
    }

    public String getGoodsPicture() {
        return goodsPicture;
    }

    public void setGoodsPicture(String goodsPicture) {
        this.goodsPicture = goodsPicture == null ? null : goodsPicture.trim();
    }
}