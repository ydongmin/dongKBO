package com.dong.KBO.domain;

import java.util.Objects;

public class TeamRankDto {
    private Integer bno;
    private String team_name;
    private Integer game_count;
    private Integer win_count;
    private Integer defeat_count;
    private Integer draw_count;
    private double winning_rate;
    private  double game_difference;

    public TeamRankDto() {}

    public TeamRankDto(Integer bno, String team_name, Integer game_count, Integer win_count, Integer defeat_count, Integer draw_count, double winning_rate, double game_difference) {
        this.bno = bno;
        this.team_name = team_name;
        this.game_count = game_count;
        this.win_count = win_count;
        this.defeat_count = defeat_count;
        this.draw_count = draw_count;
        this.winning_rate = winning_rate;
        this.game_difference = game_difference;
    }

    @Override
    public String toString() {
        return "TeamRankDto{" +
                "bno=" + bno +
                ", team_name=" + team_name +
                ", game_count=" + game_count +
                ", win_count=" + win_count +
                ", defeat_count=" + defeat_count +
                ", draw_count=" + draw_count +
                ", winning_rate=" + winning_rate +
                ", game_difference=" + game_difference +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TeamRankDto that = (TeamRankDto) o;
        return Double.compare(that.winning_rate, winning_rate) == 0 && Double.compare(that.game_difference, game_difference) == 0 && Objects.equals(bno, that.bno) &&  Objects.equals(team_name, that.team_name) && Objects.equals(game_count, that.game_count) && Objects.equals(win_count, that.win_count) && Objects.equals(defeat_count, that.defeat_count) && Objects.equals(draw_count, that.draw_count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, team_name, game_count, win_count, defeat_count, draw_count, winning_rate, game_difference);
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }


    public String getTeam_name() {
        return team_name;
    }

    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }

    public Integer getGame_count() {
        return game_count;
    }

    public void setGame_count(Integer game_count) {
        this.game_count = game_count;
    }

    public Integer getWin_count() {
        return win_count;
    }

    public void setWin_count(Integer win_count) {
        this.win_count = win_count;
    }

    public Integer getDefeat_count() {
        return defeat_count;
    }

    public void setDefeat_count(Integer defeat_count) {
        this.defeat_count = defeat_count;
    }

    public Integer getDraw_count() {
        return draw_count;
    }

    public void setDraw_count(Integer draw_count) {
        this.draw_count = draw_count;
    }

    public double getWinning_rate() {
        return winning_rate;
    }

    public void setWinning_rate(double winning_rate) {
        this.winning_rate = winning_rate;
    }

    public double getGame_difference() {
        return game_difference;
    }

    public void setGame_difference(double game_difference) {
        this.game_difference = game_difference;
    }
}
