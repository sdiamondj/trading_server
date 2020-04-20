package cn.edu.ncu.trading_server.entity;

import java.util.Date;

public class Order {
    private Integer orderId;

    private Integer orderBuyer;

    private Integer orderGoods;

    private Short orderState;

    private String orderCreateTime;

    private String orderUpdateTime;

    private String orderReceivingAccount;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderBuyer() {
        return orderBuyer;
    }

    public void setOrderBuyer(Integer orderBuyer) {
        this.orderBuyer = orderBuyer;
    }

    public Integer getOrderGoods() {
        return orderGoods;
    }

    public void setOrderGoods(Integer orderGoods) {
        this.orderGoods = orderGoods;
    }

    public Short getOrderState() {
        return orderState;
    }

    public void setOrderState(Short orderState) {
        this.orderState = orderState;
    }

    public String getOrderCreateTime() {
        return orderCreateTime;
    }

    public void setOrderCreateTime(String orderCreateTime) {
        this.orderCreateTime = orderCreateTime == null ? null : orderCreateTime.trim();
    }

    public String getOrderUpdateTime() {
        return orderUpdateTime;
    }

    public void setOrderUpdateTime(String orderUpdateTime) {
        this.orderUpdateTime = orderUpdateTime == null ? null : orderUpdateTime.trim();
    }

    public String getOrderReceivingAccount() {
        return orderReceivingAccount;
    }

    public void setOrderReceivingAccount(String orderReceivingAccount) {
        this.orderReceivingAccount = orderReceivingAccount == null ? null : orderReceivingAccount.trim();
    }
}