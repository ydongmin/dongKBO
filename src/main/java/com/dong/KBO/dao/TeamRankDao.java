package com.dong.KBO.dao;


import com.dong.KBO.domain.TeamRankDto;

import java.util.List;

public interface TeamRankDao {
    List<TeamRankDto> selectAll() throws Exception;
    TeamRankDto select(String team_name) throws Exception;

    int update(TeamRankDto teamRankDto) throws Exception;

//    int count() throws Exception;
//
//    void deleteAll() throws Exception;
}
