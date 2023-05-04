package com.dong.KBO.domain;

import java.util.Objects;

public class H_recordDto {
    private Integer hitter_rank;
    private Integer bno;
    private String player_name;
    private String team_name;
    private double h_avg;
    private Integer game_count;
    private Integer plate_a;
    private Integer hit;
    private Integer double_hit;
    private Integer triple_hit;
    private Integer hr;
    private Integer run_batted_in;
    private Integer runs;
    private Integer steal;
    private Integer four_ball;
    private Integer strike_out;
    private double on_base_per;
    private double slugging_per;

    public H_recordDto() {}

    public H_recordDto(String player_name) {
        this.player_name = player_name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        H_recordDto that = (H_recordDto) o;
        return Double.compare(that.on_base_per, on_base_per) == 0 && Double.compare(that.slugging_per, slugging_per) == 0 && Objects.equals(hitter_rank, that.hitter_rank) && Objects.equals(bno, that.bno) && Objects.equals(player_name, that.player_name) && Objects.equals(team_name, that.team_name) && Objects.equals(h_avg, that.h_avg) && Objects.equals(game_count, that.game_count) && Objects.equals(plate_a, that.plate_a) && Objects.equals(hit, that.hit) && Objects.equals(double_hit, that.double_hit) && Objects.equals(triple_hit, that.triple_hit) && Objects.equals(hr, that.hr) && Objects.equals(run_batted_in, that.run_batted_in) && Objects.equals(runs, that.runs) && Objects.equals(steal, that.steal) && Objects.equals(four_ball, that.four_ball) && Objects.equals(strike_out, that.strike_out);
    }

    @Override
    public int hashCode() {
        return Objects.hash(hitter_rank, bno, player_name, team_name, h_avg, game_count, plate_a, hit, double_hit, triple_hit, hr, run_batted_in, runs, steal, four_ball, strike_out, on_base_per, slugging_per);
    }

    @Override
    public String toString() {
        return "H_recordDto{" +
                "hitter_rank=" + hitter_rank +
                ", bno=" + bno +
                ", player_name='" + player_name + '\'' +
                ", team_name='" + team_name + '\'' +
                ", avg=" + h_avg +
                ", game_count=" + game_count +
                ", plate_a=" + plate_a +
                ", hit=" + hit +
                ", double_hit=" + double_hit +
                ", triple_hit=" + triple_hit +
                ", hr=" + hr +
                ", run_batted_in=" + run_batted_in +
                ", runs=" + runs +
                ", steal=" + steal +
                ", four_ball=" + four_ball +
                ", strike_out=" + strike_out +
                ", on_base_per=" + on_base_per +
                ", slugging_per=" + slugging_per +
                '}';
    }

    public Integer getHitter_rank() {
        return hitter_rank;
    }

    public void setHitter_rank(Integer hitter_rank) {
        this.hitter_rank = hitter_rank;
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

    public double getH_avg() {
        return h_avg;
    }

    public void setH_avg(double h_avg) {
        this.h_avg = h_avg;
    }

    public Integer getGame_count() {
        return game_count;
    }

    public void setGame_count(Integer game_count) {
        this.game_count = game_count;
    }

    public Integer getPlate_a() {
        return plate_a;
    }

    public void setPlate_a(Integer plate_a) {
        this.plate_a = plate_a;
    }

    public Integer getHit() {
        return hit;
    }

    public void setHit(Integer hit) {
        this.hit = hit;
    }

    public Integer getDouble_hit() {
        return double_hit;
    }

    public void setDouble_hit(Integer double_hit) {
        this.double_hit = double_hit;
    }

    public Integer getTriple_hit() {
        return triple_hit;
    }

    public void setTriple_hit(Integer triple_hit) {
        this.triple_hit = triple_hit;
    }

    public Integer getHr() {
        return hr;
    }

    public void setHr(Integer hr) {
        this.hr = hr;
    }

    public Integer getRun_batted_in() {
        return run_batted_in;
    }

    public void setRun_batted_in(Integer run_batted_in) {
        this.run_batted_in = run_batted_in;
    }

    public Integer getRuns() {
        return runs;
    }

    public void setRuns(Integer runs) {
        this.runs = runs;
    }

    public Integer getSteal() {
        return steal;
    }

    public void setSteal(Integer steal) {
        this.steal = steal;
    }

    public Integer getFour_ball() {
        return four_ball;
    }

    public void setFour_ball(Integer four_ball) {
        this.four_ball = four_ball;
    }

    public Integer getStrike_out() {
        return strike_out;
    }

    public void setStrike_out(Integer strike_out) {
        this.strike_out = strike_out;
    }

    public double getOn_base_per() {
        return on_base_per;
    }

    public void setOn_base_per(double on_base_per) {
        this.on_base_per = on_base_per;
    }

    public double getSlugging_per() {
        return slugging_per;
    }

    public void setSlugging_per(double slugging_per) {
        this.slugging_per = slugging_per;
    }
}