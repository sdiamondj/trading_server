package cn.edu.ncu.trading_server.entity;

import java.util.Date;

public class Goods {
    private Integer goodsId;

    private String goodsName;

    private Integer goodsGame;

    private Integer goodsSeller;

    private Double goodsPrice;

    private Short goodsState;

    private String goodsGameServer;

    private Date goodsUpdateTime;

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

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
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

    public Date getGoodsUpdateTime() {
        return goodsUpdateTime;
    }

    public void setGoodsUpdateTime(Date goodsUpdateTime) {
        this.goodsUpdateTime = goodsUpdateTime;
    }
}