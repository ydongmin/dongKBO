package com.dong.KBO.domain;

import java.util.Objects;

public class P_recordDto {
    private Integer pitcher_rank;
    private Integer bno;
    private String player_name;
    private String team_name;
    private double e_r_a;
    private Integer game_count;
    private Integer inning;
    private Integer win_count;
    private Integer defeat_count;
    private Integer save_count;
    private Integer hold_count;
    private Integer kk_count;
    private Integer p_hit_count;
    private Integer p_homrun_count;
    private Integer p_score_count;
    private Integer fourball_count;
    private Integer hit_count;
    private double winning_rate;

    public P_recordDto() {}

    public P_recordDto(Integer pitcher_rank, Integer bno, String player_name, String team_name, double e_r_a, Integer game_count, Integer inning, Integer win_count, Integer defeat_count, Integer save_count, Integer hold_count, Integer kk_count, Integer p_hit_count, Integer p_homrun_count, Integer p_score_count, Integer fourball_count, Integer hit_count, double winning_rate) {
        this.pitcher_rank = pitcher_rank;
        this.bno = bno;
        this.player_name = player_name;
        this.team_name = team_name;
        this.e_r_a = e_r_a;
        this.game_count = game_count;
        this.inning = inning;
        this.win_count = win_count;
        this.defeat_count = defeat_count;
        this.save_count = save_count;
        this.hold_count = hold_count;
        this.kk_count = kk_count;
        this.p_hit_count = p_hit_count;
        this.p_homrun_count = p_homrun_count;
        this.p_score_count = p_score_count;
        this.fourball_count = fourball_count;
        this.hit_count = hit_count;
        this.winning_rate = winning_rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        P_recordDto that = (P_recordDto) o;
        return Double.compare(that.e_r_a, e_r_a) == 0 && Double.compare(that.winning_rate, winning_rate) == 0 && Objects.equals(pitcher_rank, that.pitcher_rank) && Objects.equals(bno, that.bno) && Objects.equals(player_name, that.player_name) && Objects.equals(team_name, that.team_name) && Objects.equals(game_count, that.game_count) && Objects.equals(inning, that.inning) && Objects.equals(win_count, that.win_count) && Objects.equals(defeat_count, that.defeat_count) && Objects.equals(save_count, that.save_count) && Objects.equals(hold_count, that.hold_count) && Objects.equals(kk_count, that.kk_count) && Objects.equals(p_hit_count, that.p_hit_count) && Objects.equals(p_homrun_count, that.p_homrun_count) && Objects.equals(p_score_count, that.p_score_count) && Objects.equals(fourball_count, that.fourball_count) && Objects.equals(hit_count, that.hit_count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(pitcher_rank, bno, player_name, team_name, e_r_a, game_count, inning, win_count, defeat_count, save_count, hold_count, kk_count, p_hit_count, p_homrun_count, p_score_count, fourball_count, hit_count, winning_rate);
    }

    @Override
    public String toString() {
        return "P_recordDto{" +
                "rank=" + pitcher_rank +
                ", bno=" + bno +
                ", player_name='" + player_name + '\'' +
                ", team_name='" + team_name + '\'' +
                ", e_r_a=" + e_r_a +
                ", game_count=" + game_count +
                ", inning=" + inning +
                ", win_count=" + win_count +
                ", defeat_count=" + defeat_count +
                ", save_count=" + save_count +
                ", hold_count=" + hold_count +
                ", kk_count=" + kk_count +
                ", p_hit_count=" + p_hit_count +
                ", p_homrun_count=" + p_homrun_count +
                ", p_score_count=" + p_score_count +
                ", fourball_count=" + fourball_count +
                ", hit_count=" + hit_count +
                ", winning_rate=" + winning_rate +
                '}';
    }

    public Integer getPitcher_rank() {
        return pitcher_rank;
    }

    public void setPitcher_rank(Integer pitcher_rank) {
        this.pitcher_rank = pitcher_rank;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getPlayer_name() {
        return player_name;
    }

    public void setPlayer_name(String player_name) {
        this.player_name = player_name;
    }

    public String getTeam_name() {
        return team_name;
    }

    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }

    public double getE_r_a() {
        return e_r_a;
    }

    public void setE_r_a(double e_r_a) {
        this.e_r_a = e_r_a;
    }

    public Integer getGame_count() {
        return game_count;
    }

    public void setGame_count(Integer game_count) {
        this.game_count = game_count;
    }

    public Integer getInning() {
        return inning;
    }

    public void setInning(Integer inning) {
        this.inning = inning;
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

    public Integer getSave_count() {
        return save_count;
    }

    public void setSave_count(Integer save_count) {
        this.save_count = save_count;
    }

    public Integer getHold_count() {
        return hold_count;
    }

    public void setHold_count(Integer hold_count) {
        this.hold_count = hold_count;
    }

    public Integer getKk_count() {
        return kk_count;
    }

    public void setKk_count(Integer kk_count) {
        this.kk_count = kk_count;
    }

    public Integer getP_hit_count() {
        return p_hit_count;
    }

    public void setP_hit_count(Integer p_hit_count) {
        this.p_hit_count = p_hit_count;
    }

    public Integer getP_homrun_count() {
        return p_homrun_count;
    }

    public void setP_homrun_count(Integer p_homrun_count) {
        this.p_homrun_count = p_homrun_count;
    }

    public Integer getP_score_count() {
        return p_score_count;
    }

    public void setP_score_count(Integer p_score_count) {
        this.p_score_count = p_score_count;
    }

    public Integer getFourball_count() {
        return fourball_count;
    }

    public void setFourball_count(Integer fourball_count) {
        this.fourball_count = fourball_count;
    }

    public Integer getHit_count() {
        return hit_count;
    }

    public void setHit_count(Integer hit_count) {
        this.hit_count = hit_count;
    }

    public double getWinning_rate() {
        return winning_rate;
    }

    public void setWinning_rate(double winning_rate) {
        this.winning_rate = winning_rate;
    }
}
