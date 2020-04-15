package cn.edu.ncu.trading_server.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GoodVO {
    int code;
    String msg;
    int count;
    List<SearchGood> data;
}
