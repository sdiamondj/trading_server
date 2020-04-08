package cn.edu.ncu.trading_server.entity;

public class Game {
    private Integer gameId;

    private String gameName;

    private String gamePicture;

    private Short gameType;

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName == null ? null : gameName.trim();
    }

    public String getGamePicture() {
        return gamePicture;
    }

    public void setGamePicture(String gamePicture) {
        this.gamePicture = gamePicture == null ? null : gamePicture.trim();
    }

    public Short getGameType() {
        return gameType;
    }

    public void setGameType(Short gameType) {
        this.gameType = gameType;
    }
}