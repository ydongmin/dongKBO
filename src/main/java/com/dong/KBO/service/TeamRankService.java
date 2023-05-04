package com.dong.KBO.service;

import com.dong.KBO.domain.TeamRankDto;

import java.util.List;

public interface TeamRankService {
    List<TeamRankDto> getList() throws Exception;
    TeamRankDto read(String team_name) throws Exception;
}
